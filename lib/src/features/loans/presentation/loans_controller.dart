import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/domain/entities/loan_entity.dart';
import 'package:yanmii_wallet/src/features/loans/application/loans_service.dart';
import 'package:yanmii_wallet/src/features/loans/presentation/loans_state.dart';

class LoansController extends StateNotifier<TransactionsState> {
  LoansController(this.ref) : super(const TransactionsState());
  final Ref ref;

  Future<void> getLoans() async {
    await ref.read(loansServiceProvider.notifier).getLoans();
    if (mounted) {
      state = state.copyWith(
        transactions: AsyncData(ref.read(loansServiceProvider)),
      );
    }
  }

  Future<void> delete(LoanEntity item) async {
    await ref.read(loansServiceProvider.notifier).deleteTransaction(item);
    if (mounted) {
      state = state.copyWith(
        transactions: AsyncData(ref.watch(loansServiceProvider)),
      );
    }
  }
}

final loansControllerProvider =
    StateNotifierProvider.autoDispose<LoansController, TransactionsState>(
  (ref) => LoansController(ref)..getLoans(),
);
