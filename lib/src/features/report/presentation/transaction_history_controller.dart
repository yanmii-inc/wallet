import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/features/report/application/report_service.dart';
import 'package:yanmii_wallet/src/features/report/presentation/transaction_history_state.dart';

class TransactionHistoryController
    extends StateNotifier<TransactionHistoryState> {
  TransactionHistoryController(this.ref)
      : super(const TransactionHistoryState());
  final Ref ref;

  Future<void> getTransactionsByTitle(String title, DateTime startDate) async {
    log('getTransactions $title $startDate');
    await ref.read(reportServiceProvider).getTransactionsByTitle(
          title,
          startDate: startDate,
        );
    if (mounted) {
      state = state.copyWith(
        transactions: AsyncData(ref.watch(reportServiceProvider).transactions),
      );
    }
  }

  Future<void> getTransactionsByCategory(
      int categoryId, DateTime startDate,) async {
    log('getTransactions $categoryId $startDate');
    await ref.read(reportServiceProvider).getTransactionsByCategory(
          categoryId,
          startDate: startDate,
        );
    if (mounted) {
      state = state.copyWith(
        transactions: AsyncData(ref.watch(reportServiceProvider).transactions),
      );
    }
  }
}

final transactionHistoryControllerProvider = StateNotifierProvider<
    TransactionHistoryController, TransactionHistoryState>(
  TransactionHistoryController.new,
);
