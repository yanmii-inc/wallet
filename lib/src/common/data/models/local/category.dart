import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required String label,
    @Default(null) @JsonKey(includeToJson: false) int? id,
    @Default(null) @JsonKey(name: 'cloud_id') String? cloudId,
    @Default(null) @JsonKey(name: 'user_id') String? userId,
    @Default(null) @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

extension CategoryExtension on Category {
  Map<String, dynamic> toSupabaseJson() {
    final json = toJson()..remove('id');
    if (cloudId != null) {
      json['id'] = cloudId;
      json.remove('cloud_id');
    }
    return json;
  }
}
