import 'package:freezed_annotation/freezed_annotation.dart';

part 'loan_payment_entity.freezed.dart';

@freezed
class LoanPaymentEntity with _$LoanPaymentEntity {
  const factory LoanPaymentEntity({
    required String date,
    required int amount,
    required int loanId,
    int? id,
    int? walletId,
    String? note,
  }) = _LoanPaymentEntity;
}
