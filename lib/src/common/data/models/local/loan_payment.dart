import 'package:freezed_annotation/freezed_annotation.dart';

part 'loan_payment.freezed.dart';
part 'loan_payment.g.dart';

@freezed
class LoanPayment with _$LoanPayment {
  const factory LoanPayment({
    required String date,
    required int amount,
    @JsonKey(name: 'loan_id') required int loanId,
    int? id,
    @JsonKey(name: 'wallet_id') int? walletId,
    String? note,
  }) = _LoanPayment;

  factory LoanPayment.fromJson(Map<String, dynamic> json) =>
      _$LoanPaymentFromJson(json);
}
