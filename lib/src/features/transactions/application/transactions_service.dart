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

class TransactionsService {
  TransactionsService(this.ref);
  final Ref ref;

  TransactionRepository get _transactionRepository =>
      ref.watch(transactionRepositoryProvider);
  CategoryRepository get _categoryRepository =>
      ref.watch(categoryRepositoryProvider);

  List<TransactionEntity> transactions = [];

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
    int? categoryId;

    if (category != null) {
      if (category.id == null) {
        final result = await _categoryRepository
            .createCategory(Category(label: category.label));
        result.when(
          success: (data) => categoryId = data,
          failure: (error, stackTrace) {},
        );
      } else {
        categoryId = category.id;
      }
    }

    try {
      await _insertTransaction(
        amount: int.parse(amount),
        date: date.toIso8601String(),
        description: description,
        walletId: wallet.id,
        categoryId: categoryId,
        type: type.name,
        destWalletId: destWallet?.id,
        title: title,
      );
    } catch (e, st) {
      log(st.toString());
      rethrow;
    }
  }

  Future<void> getTransactionList(DateTime date) async {
    final mapper = ref.read(transactionMapperProvider);
    final result = await _transactionRepository.getTransactionList(date: date);

    result.when(
      success: (data) {
        transactions =
            data.map(mapper.mapTransactionToTransactionEntity).toList();
        log('transactions $transactions');
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
    required int? walletId,
    required String type,
    required int? categoryId,
    int? destWalletId,
  }) async {
    final transaction = Transaction(
      amount: amount,
      date: date,
      description: description,
      walletId: walletId,
      destWalletId: destWalletId,
      categoryId: categoryId,
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
        transactions = [...transactions, transactionEntity];
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
    int? categoryId;

    if (category != null) {
      if (category.id == null) {
        final result = await _categoryRepository
            .createCategory(Category(label: category.label));
        result.when(
          success: (data) => categoryId = data,
          failure: (error, stackTrace) {},
        );
      } else {
        categoryId = category.id;
      }
    }

    final value = Transaction(
      id: id,
      amount: int.parse(amount),
      title: title,
      date: date.toIso8601String(),
      description: description,
      walletId: wallet.id,
      destWalletId: destWallet?.id,
      categoryId: categoryId,
      type: type.name,
    );

    final result = await _transactionRepository.updateTransaction(value);

    result.when(
      success: (data) {
        final mapper = ref.read(transactionMapperProvider);

        final transactionEntity =
            mapper.mapTransactionToTransactionEntity(value);
        transactions = [
          ...transactions.map((transaction) {
            if (transaction.id == transactionEntity.id) {
              return transactionEntity;
            } else {
              return transaction;
            }
          }),
        ];
      },
      failure: (_, stackTrace) {},
    );
  }

  Future<void> deleteTransaction(TransactionEntity transaction) async {
    final result = await _transactionRepository.delete(transaction.id!);

    result.when(
      success: (_) {
        transactions.removeWhere((element) => element.id == transaction.id);
      },
      failure: (_, stackTrace) {
        log('Error removing transaction', stackTrace: stackTrace);
      },
    );
  }
}

final transactionsServiceProvider = Provider<TransactionsService>(
  TransactionsService.new,
);
