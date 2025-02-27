import 'package:freezed_annotation/freezed_annotation.dart';

part 'title_total.freezed.dart';
part 'title_total.g.dart';

@freezed
class TitleTotal with _$TitleTotal {
  const factory TitleTotal({
    required String title,
    required int id,
    required int total,
  }) = _TitleTotal;

  factory TitleTotal.fromJson(Map<String, dynamic> json) =>
      _$TitleTotalFromJson(json);
}
