// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_total.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryTotalImpl _$$CategoryTotalImplFromJson(Map<String, dynamic> json) =>
    _$CategoryTotalImpl(
      label: json['label'] as String,
      id: (json['id'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$CategoryTotalImplToJson(_$CategoryTotalImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'id': instance.id,
      'total': instance.total,
    };
