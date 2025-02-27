import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/features/report/application/report_service.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/monthly_view_state.dart';

class ReportController extends StateNotifier<MonthlyViewState> {
  ReportController(this.ref) : super(const MonthlyViewState());
  final Ref ref;

  Future<void> getMonthlyRecaps() async {
    state = state.copyWith(months: const AsyncLoading());

    await ref.read(reportServiceProvider).getMonthlyRecaps();

    if (mounted) {
      state = state.copyWith(
        months:
            AsyncValue.data(ref.watch(reportServiceProvider).monthlyBalances),
      );
    }
  }
}

final monthlyControllerProvider =
    StateNotifierProvider<ReportController, MonthlyViewState>(
  ReportController.new,
);
