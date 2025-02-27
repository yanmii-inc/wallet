import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yanmii_wallet/src/features/report/domain/entities/report_entity.dart';

part 'per_category_recap_state.freezed.dart';

@freezed
class PerCategoryRecapState with _$PerCategoryRecapState {
  const factory PerCategoryRecapState({
    @Default(AsyncLoading<List<ReportEntity>>())
    AsyncValue<List<ReportEntity>> categoryReports,
  }) = _PerCategoryRecapState;
}
