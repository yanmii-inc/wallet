import 'package:freezed_annotation/freezed_annotation.dart';
part 'report_entity.freezed.dart';

@freezed
class ReportEntity with _$ReportEntity {
  const factory ReportEntity({
    required int id,
    required String name,
    required int count,
    required int percentage,
  }) = _ReportEntity;
}
