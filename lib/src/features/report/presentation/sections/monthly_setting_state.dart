import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yanmii_wallet/src/common/domain/entities/monthly_balance_entity.dart';

part 'monthly_setting_state.freezed.dart';

@freezed
class MonthlySettingState with _$MonthlySettingState {
  const factory MonthlySettingState({
    @Default(false) bool showCumulativeBalance,
    @Default(1) int startDate,
  }) = _MonthlySettingState;
}
