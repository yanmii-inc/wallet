import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_entity.freezed.dart';

/// Entity description
@freezed
class CategoryEntity with _$CategoryEntity {
  const factory CategoryEntity({
    required String label,
    int? id,
  }) = _CategoryEntity;
}
