import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/features/report/application/report_service.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/monthly_view_state.dart';
import 'package:yanmii_wallet/src/utils/helpers/shared_preference_helper.dart';

class ReportController extends StateNotifier<MonthlyViewState> {
  ReportController(this.ref) : super(const MonthlyViewState());
  final Ref ref;

  Future<void> getMonthlyRecap() async {
    state = state.copyWith(months: const AsyncLoading());

    await ref.read(reportServiceProvider).getMonthlyRecap();

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
        ReportController.new);
