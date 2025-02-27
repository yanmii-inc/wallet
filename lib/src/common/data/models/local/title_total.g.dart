// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'title_total.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TitleTotalImpl _$$TitleTotalImplFromJson(Map<String, dynamic> json) =>
    _$TitleTotalImpl(
      title: json['title'] as String,
      id: (json['id'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$TitleTotalImplToJson(_$TitleTotalImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'total': instance.total,
    };
