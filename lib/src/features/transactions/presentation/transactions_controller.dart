import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/features/transactions/application/transactions_service.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/transactions_state.dart';

class TransactionsController extends StateNotifier<TransactionsState> {
  TransactionsController(this.ref) : super(const TransactionsState());
  final Ref ref;

  Future<void> getTransactions() async {
    await ref.read(transactionsServiceProvider.notifier).getTransactionList();

    if (mounted) {
      state =
          state.copyWith(transactions: ref.watch(transactionsServiceProvider));
    }
  }
}

final transactionsControllerProvider = StateNotifierProvider.autoDispose<
    TransactionsController, TransactionsState>(
  (ref) => TransactionsController(ref)..getTransactions(),
);
