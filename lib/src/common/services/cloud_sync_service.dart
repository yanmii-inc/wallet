import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yanmii_wallet/src/common/data/models/local/transaction.dart';
import 'package:yanmii_wallet/src/common/data/repositories/transaction_repository.dart';
import 'package:yanmii_wallet/src/common/services/auth_service.dart';
import 'package:yanmii_wallet/src/common/services/category_sync_service.dart';
import 'package:yanmii_wallet/src/common/services/wallet_sync_service.dart';

class CloudSyncService extends StateNotifier<bool> {
  CloudSyncService(this.ref) : super(false) {
    _client = Supabase.instance.client;
    _transactionRepo = ref.read(transactionRepositoryProvider);
    _authService = ref.read(authServiceProvider);
  }

  final Ref ref;
  late final SupabaseClient _client;
  late final TransactionRepository _transactionRepo;
  late final AuthService _authService;

  Future<List<Transaction>> _getNewLocalTransactions() async {
    log('Step 1: Fetching new local transactions (without cloud_id)...');
    final result = await _transactionRepo.getAllTransactions();
    return result.when(
      success: (transactions) {
        final newTransactions =
            transactions.where((t) => t.cloudId == null).toList();
        log('Found ${newTransactions.length} new local transactions');
        return newTransactions;
      },
      failure: (e, st) {
        log('Error fetching local transactions: $e\n$st');
        return [];
      },
    );
  }

  Future<void> _uploadNewTransactions(List<Transaction> transactions) async {
    if (transactions.isEmpty) {
      log('No new transactions to upload');
      return;
    }

    log('Step 2: Batch uploading ${transactions.length} new transactions to cloud...');
    try {
      // Get all transactions for this user to check duplicates
      final existingTransactions = await _client
          .from('transactions')
          .select()
          .eq('user_id', _authService.currentUser!.uid);

      // Convert to Transaction objects for easier comparison
      final cloudTransactions = (existingTransactions as List)
          .map((json) => Transaction.fromJson(json as Map<String, dynamic>))
          .toList();

      // Filter out transactions that already exist by comparing content
      final newTransactions = transactions.where((local) {
        return !cloudTransactions.any(
          (cloud) =>
              cloud.amount == local.amount &&
              cloud.categoryId == local.categoryId &&
              cloud.date == local.date &&
              cloud.description == local.description &&
              cloud.type == local.type,
        );
      }).toList();

      if (newTransactions.isEmpty) {
        log('All transactions already exist in cloud');
        return;
      }

      log('Uploading ${newTransactions.length} truly new transactions...');

      // Before inserting each transaction, sync its category and wallet
      final categorySync = ref.read(categorySyncServiceProvider.notifier);
      final walletSync = ref.read(walletSyncServiceProvider);
      for (final transaction in newTransactions) {
        if (transaction.categoryId != null) {
          await categorySync.syncCategoryById(transaction.categoryId!);
        }
        if (transaction.walletId != null) {
          await walletSync.syncWalletById(transaction.walletId!);
        }
      }

      // Prepare batch data
      final batchData = newTransactions.map((transaction) {
        final data = <String, dynamic>{
          ...transaction.toSupabaseJson(),
          'user_id': _authService.currentUser!.uid,
          'updated_at': DateTime.now().toIso8601String(),
        }..remove('id');
        return data;
      }).toList();

      // Batch insert and get results
      final results =
          await _client.from('transactions').insert(batchData).select();

      final insertedRows = results as List;

      // Helper to create a composite key for both local and cloud transactions
      String transactionKey(dynamic rowOrTransaction) {
        if (rowOrTransaction is Map) {
          // Supabase row
          return '${rowOrTransaction['amount']}_${rowOrTransaction['category_id']}_${rowOrTransaction['date']}_${rowOrTransaction['description']}_${rowOrTransaction['type']}';
        } else if (rowOrTransaction is Transaction) {
          // Local transaction
          return '${rowOrTransaction.amount}_${rowOrTransaction.categoryId}_${rowOrTransaction.date}_${rowOrTransaction.description}_${rowOrTransaction.type}';
        }
        throw ArgumentError('Invalid type for transactionKey');
      }

      // Create a map of composite key to cloud data for efficient lookup
      final cloudDataMap = Map.fromEntries(
        insertedRows.map((row) => MapEntry(transactionKey(row), row)),
      );

      // Update local transactions with their cloud IDs
      final updates = <Transaction>[];
      for (final transaction in newTransactions) {
        final key = transactionKey(transaction);
        final cloudData = cloudDataMap[key];
        if (cloudData != null) {
          updates.add(
            transaction.copyWith(
              cloudId: cloudData['id'].toString(),
              updatedAt: DateTime.parse(cloudData['updated_at'] as String),
            ),
          );
        }
      }

      // Update local database
      if (updates.isNotEmpty) {
        for (final transaction in updates) {
          await _transactionRepo.updateTransaction(transaction);
        }
        log('Successfully updated ${updates.length} local transactions with cloud IDs');
      }
    } catch (e, st) {
      log('Error in batch upload of transactions: $e\n$st');
    }
  }

  Future<List<Transaction>> _getCloudTransactions() async {
    log('Step 3: Fetching all cloud transactions...');
    try {
      final result = await _client
          .from('transactions')
          .select()
          .eq('user_id', _authService.currentUser!.uid);

      final transactions = (result as List)
          .map((json) => Transaction.fromJson(json as Map<String, dynamic>))
          .toList();
      log('Found ${transactions.length} cloud transactions');
      return transactions;
    } catch (e, st) {
      log('Error fetching cloud transactions: $e\n$st');
      return [];
    }
  }

  Future<void> _updateOutdatedLocalTransactions(
    List<Transaction> localTransactions,
    List<Transaction> cloudTransactions,
  ) async {
    log('Step 4: Updating outdated local transactions...');
    final toUpdate = <Transaction>[];

    for (final local in localTransactions.where((t) => t.cloudId != null)) {
      final cloud = cloudTransactions.firstWhere(
        (c) => c.cloudId == local.cloudId,
        orElse: () => local,
      );

      if (cloud.updatedAt != null &&
          local.updatedAt != null &&
          cloud.updatedAt!.isAfter(local.updatedAt!)) {
        toUpdate.add(cloud);
      }
    }

    if (toUpdate.isEmpty) {
      log('No local transactions need updating');
      return;
    }

    log('Updating ${toUpdate.length} local transactions...');
    for (final transaction in toUpdate) {
      await _transactionRepo.updateTransaction(transaction);
    }
  }

  Future<void> _updateOutdatedCloudTransactions(
    List<Transaction> localTransactions,
    List<Transaction> cloudTransactions,
  ) async {
    log('Step 5: Updating outdated cloud transactions...');
    final toUpdate = <Transaction>[];

    for (final local in localTransactions.where((t) => t.cloudId != null)) {
      final cloud = cloudTransactions.firstWhere(
        (c) => c.cloudId == local.cloudId,
        orElse: () => local,
      );

      if (local.updatedAt != null &&
          cloud.updatedAt != null &&
          local.updatedAt!.isAfter(cloud.updatedAt!)) {
        toUpdate.add(local);
      }
    }

    if (toUpdate.isEmpty) {
      log('No cloud transactions need updating');
      return;
    }

    log('Updating ${toUpdate.length} cloud transactions...');
    for (final transaction in toUpdate) {
      await _client
          .from('transactions')
          .update(transaction.toSupabaseJson())
          .eq('id', transaction.cloudId!);
    }
  }

  Future<void> syncTransactions() async {
    if (state) {
      log('Transaction sync already in progress, skipping');
      return;
    }
    state = true;
    try {
      if (!_authService.isAuthenticated ||
          _authService.currentUser?.uid == null) {
        log('Skipping sync: Not authenticated or no user ID');
        return;
      }

      // Sync categories first to handle foreign key constraints
      final categorySync = ref.read(categorySyncServiceProvider.notifier);
      if (!categorySync.state) {
        await categorySync.syncCategories();
      } else {
        log('Category sync in progress, waiting...');
        // Wait for category sync to complete
        while (categorySync.state) {
          await Future<void>.delayed(const Duration(milliseconds: 100));
        }
      }

      // Sync wallets before transaction sync
      final walletSync = ref.read(walletSyncServiceProvider);
      await walletSync.syncWallets();

      log('Starting transaction sync for user: ${_authService.currentUser?.uid}');

      // Step 1: Get new local transactions
      final newLocalTransactions = await _getNewLocalTransactions();

      // Step 2: Upload new transactions to cloud
      await _uploadNewTransactions(newLocalTransactions);

      // Step 3: Get all cloud transactions
      final cloudTransactions = await _getCloudTransactions();

      // Get current local state after uploads
      final localResult = await _transactionRepo.getAllTransactions();
      final localTransactions = localResult.when(
        success: (transactions) => transactions,
        failure: (_, __) => <Transaction>[],
      );

      // Step 4: Update outdated local transactions
      await _updateOutdatedLocalTransactions(
        localTransactions,
        cloudTransactions,
      );

      // Step 5: Update outdated cloud transactions
      await _updateOutdatedCloudTransactions(
        localTransactions,
        cloudTransactions,
      );

      log('Transaction sync completed successfully');
    } catch (e, st) {
      log('Error during transaction sync: $e\n$st');
    } finally {
      state = false;
    }
  }
}

final cloudSyncServiceProvider =
    StateNotifierProvider<CloudSyncService, bool>((ref) {
  return CloudSyncService(ref);
});
