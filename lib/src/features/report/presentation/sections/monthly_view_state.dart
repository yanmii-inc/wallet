import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yanmii_wallet/src/common/domain/entities/monthly_balance_entity.dart';
import 'package:yanmii_wallet/src/features/report/domain/entities/report_entity.dart';

part 'monthly_view_state.freezed.dart';

@freezed
class MonthlyViewState with _$MonthlyViewState {
  const factory MonthlyViewState({
    @Default(AsyncLoading<List<MonthlyBalanceEntity>>())
    AsyncValue<List<MonthlyBalanceEntity>> months,
    @Default(false) bool showCumulativeBalance,
  }) = _MonthlyViewState;
}
