import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yanmii_wallet/src/common/data/models/local/wallet.dart';

part 'loan.freezed.dart';
part 'loan.g.dart';

@freezed
class Loan with _$Loan {
  const factory Loan({
    required String id,
    required String name,
    required double amount,
    required DateTime date,
    @JsonKey(includeToJson: false, includeIfNull: false)
    @Default(null)
    Wallet? wallet,
    @Default(null) int? walletId,
    @Default(null) String? description,
  }) = _Loan;

  factory Loan.fromJson(Map<String, dynamic> json) => _$LoanFromJson(json);
}
