import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/features/report/application/report_service.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/detailed_view_state.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/monthly_view_state.dart';

class DetailedViewController extends StateNotifier<DetailedViewState> {
  DetailedViewController(this.ref) : super(const DetailedViewState());
  final Ref ref;

  Future<void> getRealTimeReport(DateTime month) async {
    state = state.copyWith(categories: const AsyncLoading());

    await ref.read(reportServiceProvider).getCategoryTotals(month);

    if (mounted) {
      state = state.copyWith(
        categories: AsyncValue.data(ref.watch(reportServiceProvider).reports),
      );
    }
  }
}

final detailedControllerProvider = StateNotifierProvider.autoDispose<
    DetailedViewController, DetailedViewState>(DetailedViewController.new);
