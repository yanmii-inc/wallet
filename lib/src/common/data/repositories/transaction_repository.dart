import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:yanmii_wallet/src/common/data/models/local/transaction.dart'
    as model;
import 'package:yanmii_wallet/src/common/data/models/type.dart';
import 'package:yanmii_wallet/src/utils/helpers/database_helper.dart';

class TransactionRepository {
  TransactionRepository(this._databaseHelper);

  final DatabaseHelper _databaseHelper;
  Future<Database> get _db async => _databaseHelper.database;

  Future<int> createTransaction(model.Transaction value) async {
    final db = await _db;

    final id = await db.insert('transactions', value.toJson());

    return id;
  }

  Future<List<model.Transaction>> getTransactionList({
    required DateTime date,
  }) async {
    final db = await _db;

    final result = await db.query(
      'transactions',
      where: 'date = ?',
      whereArgs: [date],
    );

    final list = result.map(model.Transaction.fromJson).toList();

    return list;
  }

  Future<void> deleteTransaction() async {}

  Future<int> updateTransaction({
    required int id,
    required String amount,
    required String date,
    required String description,
    required String walletId,
    required String categoryId,
    required TransactionType type,
  }) async {
    final db = await _db;

    final value = model.Transaction(
      id: id,
      amount: double.parse(amount),
      date: date,
      description: description,
      wallet: walletId,
      category: categoryId,
      type: type,
    );

    await db.update(
      'transactions',
      value.toJson(),
      where: 'id = ?',
      whereArgs: [value.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return id;
  }
}

final transactionRepositoryProvider =
    Provider((ref) => TransactionRepository(ref.watch(databaseHelperProvider)));
