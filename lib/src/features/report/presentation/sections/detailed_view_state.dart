import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yanmii_wallet/src/common/domain/entities/monthly_balance_entity.dart';
import 'package:yanmii_wallet/src/features/report/domain/entities/report_entity.dart';

part 'detailed_view_state.freezed.dart';

@freezed
class DetailedViewState with _$DetailedViewState {
  const factory DetailedViewState({
    @Default(AsyncLoading<List<ReportEntity>>())
    AsyncValue<List<ReportEntity>> categories,
  }) = _DetailedViewState;
}
