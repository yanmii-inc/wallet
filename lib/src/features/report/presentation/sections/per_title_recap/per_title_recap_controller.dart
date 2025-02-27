import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/features/report/application/report_service.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/per_title_recap/per_title_recap_state.dart';

class PerTitleRecapController extends StateNotifier<PerTitleRecapState> {
  PerTitleRecapController(this.ref) : super(const PerTitleRecapState());

  final Ref ref;

  Future<void> getTitleTransactions(DateTime month) async {
    state = state.copyWith(titleReports: const AsyncLoading());
    await ref.read(reportServiceProvider).getTitleTransactions(month);
    if (mounted) {
      state = state.copyWith(
        titleReports:
            AsyncValue.data(ref.watch(reportServiceProvider).titleReports),
      );
    }
  }
}

final perTitleRecapControllerProvider =
    StateNotifierProvider<PerTitleRecapController, PerTitleRecapState>(
  PerTitleRecapController.new,
);
