// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MonthlyBalanceImpl _$$MonthlyBalanceImplFromJson(Map<String, dynamic> json) =>
    _$MonthlyBalanceImpl(
      year: (json['year'] as num?)?.toInt(),
      month: (json['month'] as num?)?.toInt(),
      totalExpense: (json['total_expense'] as num?)?.toDouble(),
      totalIncome: (json['total_income'] as num?)?.toDouble(),
      monthlyBalance: (json['monthly_balance'] as num?)?.toDouble(),
      runningBalance: (json['running_balance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$MonthlyBalanceImplToJson(
        _$MonthlyBalanceImpl instance) =>
    <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'total_expense': instance.totalExpense,
      'total_income': instance.totalIncome,
      'monthly_balance': instance.monthlyBalance,
      'running_balance': instance.runningBalance,
    };
