import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/data/models/local/category_total.dart';
import 'package:yanmii_wallet/src/common/data/models/local/monthly_balance.dart';
import 'package:yanmii_wallet/src/common/domain/entities/monthly_balance_entity.dart';
import 'package:yanmii_wallet/src/features/report/domain/entities/report_entity.dart';

class ReportMapper {
  ReportMapper(this.ref);

  final Ref ref;

  ReportEntity toReportEntity(CategoryTotal category, int total) {
    return ReportEntity(
      id: category.id,
      name: category.label,
      count: category.total,
      percentage: (category.total / total * 100).ceil(),
    );
  }

  MonthlyBalanceEntity toMonthlyBalanceEntity(MonthlyBalance balance,
      {required int startDate, required bool showRunningBalance}) {
    final now = DateTime.now();
    final startDateTime = DateTime(
      balance.year ?? now.year,
      balance.month ?? now.month,
      startDate,
    );
    final endDate = DateTime(
      startDateTime.year,
      startDateTime.month + 1,
      startDate,
    ).subtract(const Duration(days: 1));
    return MonthlyBalanceEntity(
      endDate: endDate,
      startDate: startDateTime,
      monthlyBalance: (balance.monthlyBalance ?? 0.0).toInt(),
      runningBalance: (balance.runningBalance ?? 0.0).toInt(),
      totalExpense: (balance.totalExpense ?? 0.0).toInt(),
      totalIncome: (balance.totalIncome ?? 0.0).toInt(),
      showRunningBalance: showRunningBalance,
    );
  }
}

final reportMapperProvider = Provider<ReportMapper>((ref) {
  return ReportMapper(ref);
});
