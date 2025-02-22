import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/domain/entities/transaction_entity.dart';
import 'package:yanmii_wallet/src/features/transactions/application/transactions_service.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/transactions_state.dart';

class TransactionsController extends StateNotifier<TransactionsState> {
  TransactionsController(this.ref)
      : super(TransactionsState(selectedDate: DateTime.now()));
  final Ref ref;

  void forward(DateTime date) {
    state = state.copyWith(selectedDate: date.add(const Duration(days: 1)));
  }

  void backward(DateTime date) {
    state =
        state.copyWith(selectedDate: date.subtract(const Duration(days: 1)));
  }

  Future<void> getTransactions(DateTime day) async {
    await ref
        .read(transactionsServiceProvider)
        .getTransactionList(state.selectedDate);
    if (mounted) {
      state = state.copyWith(
        transactions:
            AsyncData(ref.watch(transactionsServiceProvider).transactions),
      );
    }
  }

  Future<void> delete(TransactionEntity item) async {
    await ref.read(transactionsServiceProvider).deleteTransaction(item);
    if (mounted) {
      state = state.copyWith(
        transactions:
            AsyncData(ref.watch(transactionsServiceProvider).transactions),
      );
    }
  }
}

final transactionsControllerProvider =
    StateNotifierProvider<TransactionsController, TransactionsState>(
  TransactionsController.new,
);
