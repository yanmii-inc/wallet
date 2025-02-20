// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yanmii_wallet/src/common/data/models/local/category.dart';
import 'package:yanmii_wallet/src/common/data/models/local/wallet.dart';
part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required String date,
    required int amount,
    required String title,
    @Default('expense') String type,
    @Default(null) int? id,
    @Default(null) String? description,
    @Default(null) @JsonKey(name: 'wallet_id') int? walletId,
    @Default(null) @JsonKey(name: 'dest_wallet_id') int? destWalletId,
    @Default(null) @JsonKey(name: 'category_id') int? categoryId,
    @JsonKey(includeToJson: false, includeIfNull: false)
    @Default(null)
    Wallet? wallet,
    @JsonKey(includeToJson: false, includeIfNull: false)
    @Default(null)
    Wallet? destWallet,
    @JsonKey(includeToJson: false, includeIfNull: false)
    @Default(null)
    Category? category,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
