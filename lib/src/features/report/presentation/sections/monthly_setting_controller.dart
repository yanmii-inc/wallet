import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/monthly_setting_state.dart';
import 'package:yanmii_wallet/src/utils/helpers/shared_preference_helper.dart';

class MonthlySettingController extends StateNotifier<MonthlySettingState> {
  MonthlySettingController(this.ref) : super(const MonthlySettingState());
  final Ref ref;

  Future<void> setStartDate({required int value}) async {
    state = state.copyWith(startDate: value);
  }

  Future<void> setShowCumulativeBalance({required bool value}) async {
    state = state.copyWith(showCumulativeBalance: value);
  }

  Future<void> save() async {
    await SharedPreferencesHelper.saveBool(
      AppConstants.showCumulativeBalanceKey,
      state.showCumulativeBalance,
    );

    await SharedPreferencesHelper.saveInt(
      AppConstants.startDateKey,
      state.startDate,
    );
  }

  Future<void> init() async {
    state = state.copyWith(
      showCumulativeBalance: await SharedPreferencesHelper.getBool(
        AppConstants.showCumulativeBalanceKey,
      ),
      startDate:
          await SharedPreferencesHelper.getInt(AppConstants.startDateKey),
    );
  }
}

final monthlySettingControllerProvider =
    StateNotifierProvider<MonthlySettingController, MonthlySettingState>(
  MonthlySettingController.new,
);
