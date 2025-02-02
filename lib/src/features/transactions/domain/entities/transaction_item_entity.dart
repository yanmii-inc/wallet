
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yanmii_wallet/src/common/data/sources/local/hive_db.dart';

part 'transaction_item_entity.freezed.dart';
part 'transaction_item_entity.g.dart';

/// Entity description
/// //TODO: Register [TransactionItemEntityAdapter] to [HiveDB].init()
@freezed
@HiveType(typeId: 1) // TODO: Change `typeId`
class TransactionItemEntity with _$TransactionItemEntity {
  const factory TransactionItemEntity({
    // TODO: Change the field id
    @HiveField(0) String? id,
  }) = _TransactionItemEntity;

}
