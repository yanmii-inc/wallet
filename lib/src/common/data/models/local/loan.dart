import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yanmii_wallet/src/common/data/models/local/wallet.dart';

part 'loan.freezed.dart';
part 'loan.g.dart';

@freezed
class Loan with _$Loan {
  const factory Loan({
    required String name,
    required int amount,
    required String date,
    required String type,
    @Default(null) int? id,
    @JsonKey(includeToJson: false, includeIfNull: false, name: 'wallet')
    @Default(null)
    Wallet? wallet,
    @Default(null) @JsonKey(name: 'wallet_id') int? walletId,
    @Default(null) String? description,
  }) = _Loan;

  factory Loan.fromJson(Map<String, dynamic> json) => _$LoanFromJson(json);
}
