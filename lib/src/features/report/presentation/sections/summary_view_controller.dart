import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/features/report/application/report_service.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/summary_view_state.dart';

class SummaryViewController extends Notifier<SummaryViewState> {
  @override
  SummaryViewState build() => const SummaryViewState(
        monthlyBalance: AsyncLoading(),
        totalExpense: AsyncLoading(),
        totalIncome: AsyncLoading(),
      );

  ReportService get reportService => ref.read(reportServiceProvider);

  Future<void> getSummary({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    state = state.copyWith(monthlyBalance: const AsyncLoading());
    final monthlyBalance = await reportService.getMonthRecaps(
      startDate: startDate,
      endDate: endDate,
    );

    state = state.copyWith(
      monthlyBalance: AsyncData(monthlyBalance.balance),
      totalExpense: AsyncData(monthlyBalance.totalExpense),
      totalIncome: AsyncData(monthlyBalance.totalIncome),
    );
  }
}

final summaryViewControllerProvider =
    NotifierProvider<SummaryViewController, SummaryViewState>(
        SummaryViewController.new,);
