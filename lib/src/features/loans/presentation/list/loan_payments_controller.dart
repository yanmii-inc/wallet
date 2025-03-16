import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/domain/entities/loan_payment_entity.dart';
import 'package:yanmii_wallet/src/features/loans/application/loans_payment_service.dart';

class LoanPaymentsController
    extends FamilyNotifier<AsyncValue<List<LoanPaymentEntity>>, int> {
  late final int loanId;
  @override
  AsyncValue<List<LoanPaymentEntity>> build(int loanId) {
    this.loanId = loanId;
    return const AsyncLoading();
  }

  Future<void> fetchLoanPayments() async {
    final result = await ref
        .read(loanPaymentsServiceProvider.notifier)
        .fetchLoanPayments(loanId);
    state = AsyncData(result);
  }

  Future<void> delete(LoanPaymentEntity payment) async {
    //TODO:
  }
}

final loanPaymentsNotifier = NotifierProvider.family<LoanPaymentsController,
    AsyncValue<List<LoanPaymentEntity>>, int>(LoanPaymentsController.new);
