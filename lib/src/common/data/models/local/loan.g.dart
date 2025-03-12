// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoanImpl _$$LoanImplFromJson(Map<String, dynamic> json) => _$LoanImpl(
      name: json['name'] as String,
      amount: (json['amount'] as num).toInt(),
      date: json['date'] as String,
      type: json['type'] as String,
      id: (json['id'] as num?)?.toInt() ?? null,
      wallet: json['wallet'] == null
          ? null
          : Wallet.fromJson(json['wallet'] as Map<String, dynamic>),
      walletId: (json['wallet_id'] as num?)?.toInt() ?? null,
      description: json['description'] as String? ?? null,
    );

Map<String, dynamic> _$$LoanImplToJson(_$LoanImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
      'date': instance.date,
      'type': instance.type,
      'id': instance.id,
      'wallet_id': instance.walletId,
      'description': instance.description,
    };
