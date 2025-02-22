import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_total.freezed.dart';
part 'category_total.g.dart';

@freezed
class CategoryTotal with _$CategoryTotal {
  const factory CategoryTotal({
    required String label,
    required int id,
    required int total,
  }) = _CategoryTotal;

  factory CategoryTotal.fromJson(Map<String, dynamic> json) =>
      _$CategoryTotalFromJson(json);
}
