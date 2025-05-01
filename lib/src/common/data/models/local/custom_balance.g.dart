// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomBalanceImpl _$$CustomBalanceImplFromJson(Map<String, dynamic> json) =>
    _$CustomBalanceImpl(
      id: (json['id'] as num?)?.toInt() ?? null,
      title: json['title'] as String? ?? null,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
      totalExpense: (json['total_expense'] as num).toInt(),
      totalIncome: (json['total_income'] as num).toInt(),
      balance: (json['balance'] as num).toInt(),
    );

Map<String, dynamic> _$$CustomBalanceImplToJson(_$CustomBalanceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate.toIso8601String(),
      'total_expense': instance.totalExpense,
      'total_income': instance.totalIncome,
      'balance': instance.balance,
    };
