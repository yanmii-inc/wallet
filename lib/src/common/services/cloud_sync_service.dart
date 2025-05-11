import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yanmii_wallet/src/common/data/models/local/transaction.dart';
import 'package:yanmii_wallet/src/common/data/repositories/transaction_repository.dart';
import 'package:yanmii_wallet/src/common/services/auth_service.dart';
import 'package:yanmii_wallet/src/common/services/category_sync_service.dart';

class CloudSyncService {
  CloudSyncService(this.ref) {
    _client = Supabase.instance.client;
    _transactionRepo = ref.read(transactionRepositoryProvider);
    _authService = ref.read(authServiceProvider);
  }

  final Ref ref;
  late final SupabaseClient _client;
  late final TransactionRepository _transactionRepo;
  late final AuthService _authService;

  Future<void> syncTransactions() async {
    // Sync categories first to handle foreign key constraints
    await ref.read(categorySyncServiceProvider.notifier).syncCategories();

    if (!_authService.isAuthenticated ||
        _authService.currentUser?.uid == null) {
      log('Skipping sync: Not authenticated or no user ID');
      return;
    }

    log('Starting transaction sync for user: ${_authService.currentUser?.uid}');

    // Get all local transactions
    log('Fetching local transactions...');
    final localResult = await _transactionRepo.getAllTransactions();
    await localResult.when(
      success: (localTransactions) async {
        log('Found ${localTransactions.length} local transactions');

        // Get all cloud transactions
        log('Fetching cloud transactions...');
        final cloudResult = await _client
            .from('transactions')
            .select()
            .eq('user_id', _authService.currentUser!.uid);

        final cloudTransactions = (cloudResult as List)
            .map((json) => Transaction.fromJson(json as Map<String, dynamic>))
            .toList();
        log('Found ${cloudTransactions.length} cloud transactions');

        // Handle new local transactions
        final newLocalTransactions =
            localTransactions.where((t) => t.cloudId == null);
        log('Found ${newLocalTransactions.length} new local transactions to upload');
        for (final transaction in newLocalTransactions) {
          // Upload to cloud
          final result = await _client
              .from('transactions')
              .insert({
                ...transaction.toSupabaseJson(),
                'user_id': _authService.currentUser!.uid,
                'updated_at': DateTime.now().toIso8601String(),
              })
              .select()
              .single();

          // Update local with Supabase ID as cloud_id
          await _transactionRepo.updateTransaction(
            transaction.copyWith(
              cloudId: result['id']
                  .toString(), // Convert to string in case it's an integer
              updatedAt: DateTime.parse(result['updated_at'] as String),
            ),
          );
        }

        // Handle existing transactions
        final existingTransactions =
            localTransactions.where((t) => t.cloudId != null);
        log('Processing ${existingTransactions.length} existing transactions');
        for (final local in existingTransactions) {
          final cloud = cloudTransactions.firstWhere(
            (c) => c.cloudId == local.cloudId,
            orElse: () => local,
          );

          if (local.updatedAt == null ||
              cloud.updatedAt == null ||
              local.cloudId == null) {
            continue;
          }

          if (local.updatedAt!.isAfter(cloud.updatedAt!)) {
            // Local is newer, update cloud
            final updateData = local.toSupabaseJson();

            await _client
                .from('transactions')
                .update(updateData)
                .eq('id', local.cloudId!);
          } else if (cloud.updatedAt!.isAfter(local.updatedAt!)) {
            // Cloud is newer, update local
            await _transactionRepo.updateTransaction(cloud);
          }
        }

        // Handle new cloud transactions
        final newCloudTransactions = cloudTransactions.where(
          (c) => !localTransactions.any((l) => l.cloudId == c.cloudId),
        );
        log('Found ${newCloudTransactions.length} new cloud transactions to download');

        for (final transaction in newCloudTransactions) {
          await _transactionRepo.createTransaction(transaction);
        }

        log('Transaction sync completed successfully');
      },
      failure: (e, st) {},
    );
  }
}

final cloudSyncServiceProvider = Provider(CloudSyncService.new);
