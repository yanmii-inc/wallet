import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/data/mappers/transaction_mapper.dart';
import 'package:yanmii_wallet/src/common/data/models/local/category.dart';
import 'package:yanmii_wallet/src/common/data/models/local/transaction.dart';
import 'package:yanmii_wallet/src/common/data/models/type.dart';
import 'package:yanmii_wallet/src/common/data/repositories/category_repository.dart';
import 'package:yanmii_wallet/src/common/data/repositories/transaction_repository.dart';
import 'package:yanmii_wallet/src/common/domain/entities/category_entity.dart';
import 'package:yanmii_wallet/src/common/domain/entities/transaction_entity.dart';
import 'package:yanmii_wallet/src/common/domain/entities/wallet_entity.dart';

class TransactionsService extends Notifier<List<TransactionEntity>> {
  TransactionsService() : super();

  TransactionRepository get _transactionRepository =>
      ref.watch(transactionRepositoryProvider);
  CategoryRepository get _categoryRepository =>
      ref.watch(categoryRepositoryProvider);

  @override
  List<TransactionEntity> build() {
    return [];
  }

  Future<void> createTransaction({
    required String title,
    required String amount,
    required DateTime date,
    required String description,
    required WalletEntity wallet,
    required TransactionType type,
    required CategoryEntity? category,
    WalletEntity? destWallet,
  }) async {
    if (category != null) {
      if (category.id == null) {
        final result = await _categoryRepository
            .insert(Category(label: category.label));
        category = category.copyWith(
          id: result.when(
            success: (id) => id,
            failure: (error, stackTrace) => null,
          ),
        );
      }
    }

    try {
      await _insertTransaction(
        amount: int.parse(amount),
        date: date.toIso8601String(),
        description: description,
        wallet: wallet,
        category: category,
        type: type.name,
        destWallet: destWallet,
        title: title,
      );
    } catch (e, st) {
      log(st.toString());
      rethrow;
    }
  }

  Future<void> getTransactionsByDate(DateTime date) async {
    final mapper = ref.read(transactionMapperProvider);
    final result = await _transactionRepository.getTransactionList(date: date);

    result.when(
      success: (data) {
        state = data.map(mapper.mapTransactionToTransactionEntity).toList();
        // log('transactions $state');
      },
      failure: (error, stackTrace) {
        log(
          'Error mapTransactionToTransactionEntity',
          error: error,
          stackTrace: stackTrace,
        );
      },
    );
  }

  Future<void> _insertTransaction({
    required String title,
    required int amount,
    required String date,
    required String description,
    required WalletEntity wallet,
    required String type,
    required CategoryEntity? category,
    WalletEntity? destWallet,
  }) async {
    final mapper = ref.read(transactionMapperProvider);
    final transaction = Transaction(
      amount: amount,
      date: date,
      description: description,
      walletId: wallet.id,
      wallet: mapper.mapWalletEntityToWallet(wallet),
      destWalletId: destWallet?.id,
      destWallet: destWallet != null
          ? mapper.mapWalletEntityToWallet(destWallet)
          : null,
      categoryId: category?.id,
      category: category != null
          ? mapper.mapCategoryEntityToCategory(category)
          : null,
      type: type,
      title: title,
    );
    final result = await _transactionRepository.createTransaction(transaction);

    result.when(
      success: (data) {
        final mapper = ref.read(transactionMapperProvider);

        final transactionEntity = mapper.mapTransactionToTransactionEntity(
          transaction.copyWith(id: data),
        );
        state = [...state, transactionEntity];
      },
      failure: (_, stackTrace) {},
    );
  }

  List<DateTime> _getRecentDates(int itemCount) {
    final recentDates = <DateTime>[];
    final now = DateTime.now();
    for (var i = 0; i < itemCount; i++) {
      recentDates.add(now.subtract(Duration(days: i)));
    }
    return recentDates.reversed.toList();
  }

  Future<List<DateTime>> getPageDates() async {
    final count = await _transactionRepository.getDateCounts();
    return _getRecentDates(count ?? 1);
  }

  Future<void> updateTransaction({
    required int id,
    required String amount,
    required String title,
    required DateTime date,
    required String description,
    required WalletEntity wallet,
    required TransactionType type,
    CategoryEntity? category,
    WalletEntity? destWallet,
  }) async {
    if (category != null) {
      if (category.id == null) {
        final result = await _categoryRepository
            .insert(Category(label: category.label));
        category = category.copyWith(
          id: result.when(
            success: (id) => id,
            failure: (error, stackTrace) => null,
          ),
        );
      }
    }

    final mapper = ref.read(transactionMapperProvider);

    final value = Transaction(
      id: id,
      amount: int.parse(amount),
      title: title,
      date: date.toIso8601String(),
      description: description,
      walletId: wallet.id,
      wallet: mapper.mapWalletEntityToWallet(wallet),
      destWalletId: destWallet?.id,
      destWallet: destWallet != null
          ? mapper.mapWalletEntityToWallet(destWallet)
          : null,
      categoryId: category?.id,
      category: category != null
          ? mapper.mapCategoryEntityToCategory(category)
          : null,
      type: type.name,
    );

    final result = await _transactionRepository.updateTransaction(value);

    result.when(
      success: (data) {
        final transactionEntity =
            mapper.mapTransactionToTransactionEntity(value);
        state = [
          ...state.map((transaction) {
            if (transaction.id == transactionEntity.id) {
              return transactionEntity;
            } else {
              return transaction;
            }
          }),
        ];

        log('transactions $state');
      },
      failure: (_, stackTrace) {},
    );
  }

  Future<void> deleteTransaction(TransactionEntity transaction) async {
    final result = await _transactionRepository.delete(transaction.id!);

    result.when(
      success: (_) {
        state.removeWhere((element) => element.id == transaction.id);
      },
      failure: (_, stackTrace) {
        log('Error removing transaction', stackTrace: stackTrace);
      },
    );
  }

  Future<TransactionEntity> getTransactionById(int id) async {
    try {
      final transaction = await _transactionRepository.getTransactionById(id);
      final mapper = ref.read(transactionMapperProvider);
      return mapper.mapTransactionToTransactionEntity(transaction!);
    } catch (e) {
      log('Error getting transaction by id', error: e);
      rethrow;
    }
  }

  Future<List<String>> searchName(String keyword) async {
    final result = await _transactionRepository.searchName(keyword);
    return result.when(
      success: (data) => data,
      failure: (_, stackTrace) => [],
    );
  }

  Future<List<TransactionEntity>> getTransactionsByTitle(
    String title, {
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final mapper = ref.read(transactionMapperProvider);
    final result = await _transactionRepository.getTransactionsByTitle(
      title,
      startDate: startDate,
      endDate: endDate,
    );

    return result.when(
      success: (data) {
        final transactions =
            data.map(mapper.mapTransactionToTransactionEntity).toList();
        final existingTransactionsMap = {for (final t in state) t.id: t}
          ..addAll({for (final t in transactions) t.id: t});
        state = existingTransactionsMap.values.toList();
        log('transactions $state');
        return transactions;
      },
      failure: (error, stackTrace) {
        log(
          'Error mapTransactionToTransactionEntity',
          error: error,
          stackTrace: stackTrace,
        );
        return [];
      },
    );
  }

  Future<List<TransactionEntity>> getTransactionsByCategory(
    int categoryId, {
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final mapper = ref.read(transactionMapperProvider);
    final result = await _transactionRepository.getTransactionsByCategory(
      categoryId,
      startDate: startDate,
      endDate: endDate,
    );

    return result.when(
      success: (data) {
        final transactions =
            data.map(mapper.mapTransactionToTransactionEntity).toList();
        log('transactions $state');
        final existingTransactionsMap = {for (final t in state) t.id: t}
          ..addAll({for (final t in transactions) t.id: t});
        state = existingTransactionsMap.values.toList();
        return transactions;
      },
      failure: (error, stackTrace) {
        log(
          'Error mapTransactionToTransactionEntity',
          error: error,
          stackTrace: stackTrace,
        );
        return [];
      },
    );
  }
}

final transactionsServiceProvider =
    NotifierProvider<TransactionsService, List<TransactionEntity>>(
  TransactionsService.new,
);
