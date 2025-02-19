// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletImpl _$$WalletImplFromJson(Map<String, dynamic> json) => _$WalletImpl(
      name: json['name'] as String,
      id: (json['id'] as num?)?.toInt() ?? null,
      logo: json['logo'] as String? ?? null,
      balance: (json['balance'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$WalletImplToJson(_$WalletImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'logo': instance.logo,
    };
