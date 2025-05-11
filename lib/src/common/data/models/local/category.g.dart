// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      label: json['label'] as String,
      id: (json['id'] as num?)?.toInt() ?? null,
      cloudId: json['cloud_id'] as String? ?? null,
      userId: json['user_id'] as String? ?? null,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'cloud_id': instance.cloudId,
      'user_id': instance.userId,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
