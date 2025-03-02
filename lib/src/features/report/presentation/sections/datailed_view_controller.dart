import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/features/report/application/report_service.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/detailed_view_state.dart';
import 'package:yanmii_wallet/src/utils/helpers/shared_preference_helper.dart';

class DetailedViewController extends StateNotifier<DetailedViewState> {
  DetailedViewController(this.ref) : super(const DetailedViewState());
  final Ref ref;

  Future<void> getRealTimeReport(DateTime startDateTime) async {
    state = state.copyWith(categories: const AsyncLoading());
    final startDate =
        await SharedPreferencesHelper.getInt(AppConstants.startDateKey);

    final now = DateTime.now();
    final currentDay = now.day;

    DateTime startDateTime;
    if (currentDay < startDate) {
      startDateTime = DateTime(now.year, now.month - 1, startDate);
    } else {
      startDateTime = DateTime(now.year, now.month, startDate);
    }

    final result = await ref
        .read(reportServiceProvider)
        .getCategoryTotals(startDateTime: startDateTime);

    state = state.copyWith(categories: AsyncValue.data(result));
  }
}

final detailedControllerProvider = StateNotifierProvider.autoDispose<
    DetailedViewController, DetailedViewState>(DetailedViewController.new);
