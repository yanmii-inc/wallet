import 'package:freezed_annotation/freezed_annotation.dart';

part 'monthly_balance_entity.freezed.dart';

@freezed
class MonthlyBalanceEntity with _$MonthlyBalanceEntity {
  const factory MonthlyBalanceEntity({
    required DateTime startDate,
    required DateTime endDate,
    required int totalExpense,
    required int totalIncome,
    required int monthlyBalance,
    required int runningBalance,
    required bool showRunningBalance,
  }) = _MonthlyBalanceEntity;
}
