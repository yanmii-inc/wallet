import 'package:freezed_annotation/freezed_annotation.dart';

part 'monthly_setting_state.freezed.dart';

@freezed
class MonthlySettingState with _$MonthlySettingState {
  const factory MonthlySettingState({
    @Default(false) bool showCumulativeBalance,
    @Default(1) int startDate,
  }) = _MonthlySettingState;
}
