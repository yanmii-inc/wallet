// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoanImpl _$$LoanImplFromJson(Map<String, dynamic> json) => _$LoanImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      wallet: json['wallet'] == null
          ? null
          : Wallet.fromJson(json['wallet'] as Map<String, dynamic>),
      walletId: (json['walletId'] as num?)?.toInt() ?? null,
      description: json['description'] as String? ?? null,
    );

Map<String, dynamic> _$$LoanImplToJson(_$LoanImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
      'walletId': instance.walletId,
      'description': instance.description,
    };
