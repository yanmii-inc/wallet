import 'package:freezed_annotation/freezed_annotation.dart';
part 'title_report_entity.freezed.dart';

@freezed
class TitleReportEntity with _$TitleReportEntity {
  const factory TitleReportEntity({
    required int id,
    required String name,
    required int amount,
  }) = _TitleReportEntity;
}
