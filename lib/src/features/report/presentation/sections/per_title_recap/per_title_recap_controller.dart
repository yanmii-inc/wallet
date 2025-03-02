import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/features/report/application/report_service.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/per_title_recap/per_title_recap_state.dart';

class PerTitleRecapController extends StateNotifier<PerTitleRecapState> {
  PerTitleRecapController(this.ref) : super(const PerTitleRecapState());

  final Ref ref;

  Future<void> getTitleTransactions(DateTime month) async {
    log('getTitleTransactions $month');
    state = state.copyWith(titleReports: const AsyncLoading());
    final result =
        await ref.read(reportServiceProvider).getTitleTransactions(month);
    state = state.copyWith(titleReports: AsyncValue.data(result));
  }
}

final perTitleRecapControllerProvider =
    StateNotifierProvider<PerTitleRecapController, PerTitleRecapState>(
  PerTitleRecapController.new,
);
