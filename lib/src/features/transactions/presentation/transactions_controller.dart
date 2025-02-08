import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/transactions_state.dart';

class TransactionsController extends StateNotifier<TransactionsState> {
  TransactionsController(this.ref) : super(const TransactionsState());
  final Ref ref;

  Future<void> getTransactionItemEntity() async {}
}

final transactionsControllerProvider =
    StateNotifierProvider<TransactionsController, TransactionsState>(
  TransactionsController.new,
);
