

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/features/transactions/application/transactions_service.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/transactions_state.dart';



class  TransactionsController extends StateNotifier<TransactionsState> {
  TransactionsController(this.ref) : super(const TransactionsState());
  final Ref ref;

  Future<void> getTransactionItemEntity() async {
    state = state.copyWith(transactionItemEntity: const AsyncLoading());
    
    final result = await ref.read(transactionsServiceProvider).transactionItemEntity;

    result.when(
      success: (data) {
        state = state.copyWith(transactionItemEntity: AsyncValue.data(data));
      },
      failure: (error, stackTrace) {
        state = state.copyWith(transactionItemEntity: AsyncValue.error(error, stackTrace));
      },
    );
  }
}

final  transactionsControllerProvider =
    StateNotifierProvider<TransactionsController, TransactionsState>(
      TransactionsController.new,);
