import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/features/report/application/report_service.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/custom/custom_view_state.dart';

class CustomViewController extends StateNotifier<CustomViewState> {
  CustomViewController(this.ref) : super(const CustomViewState());
  final Ref ref;

  Future<void> addCustomRecap(
    String title,
    DateTime startDate,
    DateTime endDate,
  ) async {
    state = state.copyWith(months: const AsyncLoading());
    await ref.read(reportServiceProvider).addCustomRecap(
          title,
          startDate,
          endDate,
        );
    await getCustomRecaps();
  }

  Future<void> getCustomRecaps() async {
    state = state.copyWith(months: const AsyncLoading());
    final recaps = await ref.read(reportServiceProvider).getCustomRecaps();
    state = state.copyWith(months: AsyncData(recaps));
  }
}

final customControllerProvider =
    StateNotifierProvider<CustomViewController, CustomViewState>(
  CustomViewController.new,
);
