import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/domain/entities/transaction_entity.dart';
import 'package:yanmii_wallet/src/features/loans/application/loans_service.dart';
import 'package:yanmii_wallet/src/features/loans/presentation/loans_state.dart';

class LoansController extends StateNotifier<TransactionsState> {
  LoansController(this.ref)
      : super(TransactionsState(selectedDate: DateTime.now())) {
    log('TransactionsController initialized with date: ${state.selectedDate}');
  }
  final Ref ref;

  void forward(DateTime date) {
    log('forward: ${state.selectedDate}');
    state = state.copyWith(selectedDate: date.add(const Duration(days: 1)));
  }

  void backward(DateTime date) {
    state =
        state.copyWith(selectedDate: date.subtract(const Duration(days: 1)));
    log('backward: ${state.selectedDate}');
  }

  Future<void> getLoans(DateTime day) async {
    await ref
        .read(transactionsServiceProvider.notifier)
        .getTransactionsByDate(state.selectedDate);
    if (mounted) {
      state = state.copyWith(
        transactions: AsyncData(ref.read(transactionsServiceProvider)),
      );
    }
  }

  Future<void> delete(TransactionEntity item) async {
    await ref
        .read(transactionsServiceProvider.notifier)
        .deleteTransaction(item);
    if (mounted) {
      state = state.copyWith(
        transactions: AsyncData(ref.watch(transactionsServiceProvider)),
      );
    }
  }
}

final transactionsControllerProvider =
    StateNotifierProvider.autoDispose<LoansController, TransactionsState>(
  LoansController.new,
);
