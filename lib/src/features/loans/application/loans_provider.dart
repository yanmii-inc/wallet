import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/domain/entities/loan_entity.dart';
import 'package:yanmii_wallet/src/common/domain/entities/loan_payment_entity.dart';
import 'package:yanmii_wallet/src/features/loans/application/loans_payment_service.dart';
import 'package:yanmii_wallet/src/features/loans/application/loans_service.dart';

final loansProvider = Provider.family<LoanEntity?, int>((ref, id) {
  final loans = ref.watch(loansServiceProvider);
  return loans.firstWhereOrNull((t) => t.id == id);
});

final loanPaymentsProvider =
    Provider.family<LoanPaymentEntity?, int>((ref, id) {
  final loans = ref.watch(loanPaymentsServiceProvider);
  return loans.firstWhereOrNull((t) => t.id == id);
});
