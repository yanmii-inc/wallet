import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'monthly_balance.freezed.dart';
part 'monthly_balance.g.dart';

@freezed
class MonthlyBalance with _$MonthlyBalance {
  const factory MonthlyBalance({
    @JsonKey(name: 'year') int? year,
    @JsonKey(name: 'month') int? month,
    @JsonKey(name: 'total_expense') double? totalExpense,
    @JsonKey(name: 'total_income') double? totalIncome,
    @JsonKey(name: 'monthly_balance') double? monthlyBalance,
    @JsonKey(name: 'running_balance') double? runningBalance,
  }) = _MonthlyBalance;

  factory MonthlyBalance.fromJson(Map<String, dynamic> json) =>
      _$MonthlyBalanceFromJson(json);
}
