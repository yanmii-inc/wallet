// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      date: json['date'] as String,
      amount: (json['amount'] as num).toInt(),
      title: json['title'] as String,
      type: json['type'] as String? ?? 'expense',
      id: (json['id'] as num?)?.toInt() ?? null,
      description: json['description'] as String? ?? null,
      walletId: (json['wallet_id'] as num?)?.toInt() ?? null,
      destWalletId: (json['dest_wallet_id'] as num?)?.toInt() ?? null,
      categoryId: (json['category_id'] as num?)?.toInt() ?? null,
      wallet: json['wallet'] == null
          ? null
          : Wallet.fromJson(json['wallet'] as Map<String, dynamic>),
      destWallet: json['destWallet'] == null
          ? null
          : Wallet.fromJson(json['destWallet'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'amount': instance.amount,
      'title': instance.title,
      'type': instance.type,
      'id': instance.id,
      'description': instance.description,
      'wallet_id': instance.walletId,
      'dest_wallet_id': instance.destWalletId,
      'category_id': instance.categoryId,
    };
