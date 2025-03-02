import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/features/report/presentation/transaction_history_state.dart';
import 'package:yanmii_wallet/src/features/transactions/application/transactions_service.dart';

class TransactionHistoryController
    extends StateNotifier<TransactionHistoryState> {
  TransactionHistoryController(this.ref)
      : super(const TransactionHistoryState());
  final Ref ref;

  Future<void> getTransactionsByTitle(String title, DateTime startDate) async {
    final result = await ref
        .read(transactionsServiceProvider.notifier)
        .getTransactionsByTitle(
          title,
          startDate: startDate,
        );
    if (mounted) {
      state = state.copyWith(
        transactions: AsyncData(result),
        searchedTransactions: AsyncData(result),
      );
    }
  }

  Future<void> getTransactionsByCategory(
    int categoryId,
    DateTime startDate,
  ) async {
    log('getTransactions $categoryId $startDate');
    final transactions = await ref
        .read(transactionsServiceProvider.notifier)
        .getTransactionsByCategory(
          categoryId,
          startDate: startDate,
        );
    state = state.copyWith(
      transactions: AsyncData(transactions),
      searchedTransactions: AsyncData(transactions),
    );
  }

  Future<void> searchTransactions(String title) async {
    log('searchTransactions $title');
    final result = (state.transactions.valueOrNull ?? [])
        .where(
          (element) =>
              element.name.toLowerCase().contains(title.toLowerCase()) ||
              (element.category != null &&
                  element.category!.label
                      .toLowerCase()
                      .contains(title.toLowerCase())) ||
              (element.wallet != null &&
                  element.wallet!.name
                      .toLowerCase()
                      .contains(title.toLowerCase())) ||
              (element.destWallet != null &&
                  element.destWallet!.name
                      .toLowerCase()
                      .contains(title.toLowerCase())) ||
              (element.description != null &&
                  element.description!
                      .toLowerCase()
                      .contains(title.toLowerCase())),
        )
        .toList();
    log('searchTransactions $result');
    if (mounted) {
      state = state.copyWith(searchedTransactions: AsyncData(result));
    }
  }
}

final transactionHistoryControllerProvider = StateNotifierProvider<
    TransactionHistoryController, TransactionHistoryState>(
  TransactionHistoryController.new,
);
