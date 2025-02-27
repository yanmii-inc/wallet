import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yanmii_wallet/src/features/report/domain/entities/title_report_entity.dart';

part 'per_title_recap_state.freezed.dart';

@freezed
class PerTitleRecapState with _$PerTitleRecapState {
  const factory PerTitleRecapState({
    @Default(AsyncLoading<List<TitleReportEntity>>())
    AsyncValue<List<TitleReportEntity>> titleReports,
  }) = _BreakdownViewState;
}
