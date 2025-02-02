// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_item_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionItemEntityAdapter extends TypeAdapter<TransactionItemEntity> {
  @override
  final int typeId = 1;

  @override
  TransactionItemEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionItemEntity(
      id: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionItemEntity obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionItemEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
