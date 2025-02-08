// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      date: json['date'] as String,
      wallet: json['wallet'] as String,
      amount: (json['amount'] as num).toDouble(),
      category: json['category'] as String,
      type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
      id: (json['id'] as num?)?.toInt() ?? null,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'wallet': instance.wallet,
      'amount': instance.amount,
      'category': instance.category,
      'type': _$TransactionTypeEnumMap[instance.type]!,
      'id': instance.id,
      'description': instance.description,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.income: 'income',
  TransactionType.expense: 'expense',
  TransactionType.transfer: 'transfer',
};
