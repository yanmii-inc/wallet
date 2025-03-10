import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_balance.freezed.dart';
part 'custom_balance.g.dart';

@freezed
class CustomBalance with _$CustomBalance {
  const factory CustomBalance({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'start_date') required DateTime startDate,
    @JsonKey(name: 'end_date') required DateTime endDate,
    @JsonKey(name: 'total_expense') required int totalExpense,
    @JsonKey(name: 'total_income') required int totalIncome,
    @JsonKey(name: 'balance') required int balance,
  }) = _CustomBalance;

  factory CustomBalance.fromJson(Map<String, dynamic> json) =>
      _$CustomBalanceFromJson(json);
}
