import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yanmii_wallet/src/common/data/models/type.dart';
import 'package:yanmii_wallet/src/common/domain/entities/category_entity.dart';
import 'package:yanmii_wallet/src/common/domain/entities/wallet_entity.dart';

part 'transaction_entity.freezed.dart';

/// Entity description
@freezed
class TransactionEntity with _$TransactionEntity {
  const factory TransactionEntity({
    required String date,
    required WalletEntity? wallet,
    required double amount,
    required String name,
    required CategoryEntity? category,
    required TransactionType type,
    int? id,
    String? description,
  }) = _TransactionEntity;
}
