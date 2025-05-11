import 'package:hive_flutter/hive_flutter.dart';
import 'package:yanmii_wallet/src/common/data/models/local/transaction.dart';

class TransactionAdapter extends TypeAdapter<Transaction> {
  @override
  final int typeId = 2; // Make sure this is unique across all adapters

  @override
  Transaction read(BinaryReader reader) {
    return Transaction.fromJson(Map<String, dynamic>.from(reader.readMap()));
  }

  @override
  void write(BinaryWriter writer, Transaction obj) {
    writer.writeMap(obj.toJson());
  }
}
