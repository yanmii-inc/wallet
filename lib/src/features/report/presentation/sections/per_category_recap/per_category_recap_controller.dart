import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/features/report/application/report_service.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/per_category_recap/per_category_recap_state.dart';

class PerCategoryRecapController extends StateNotifier<PerCategoryRecapState> {
  PerCategoryRecapController(this.ref) : super(const PerCategoryRecapState());

  final Ref ref;

  Future<void> getCategoryTransactions(DateTime month) async {
    state = state.copyWith(categoryReports: const AsyncLoading());

    final result = await ref
        .read(reportServiceProvider)
        .getCategoryTotals(startDateTime: month);

    state = state.copyWith(categoryReports: AsyncValue.data(result));
  }
}

final perCategoryRecapControllerProvider =
    StateNotifierProvider<PerCategoryRecapController, PerCategoryRecapState>(
  PerCategoryRecapController.new,
);
