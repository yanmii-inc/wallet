import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:yanmii_wallet/src/common/data/models/local/transaction.dart'
    as model;
import 'package:yanmii_wallet/src/common/data/models/type.dart';
import 'package:yanmii_wallet/src/common/data/sources/sources.dart';
import 'package:yanmii_wallet/src/utils/helpers/database_helper.dart';

class TransactionRepository {
  TransactionRepository(this._databaseHelper);

  final DatabaseHelper _databaseHelper;
  Future<Database> get _db async => _databaseHelper.database;

  Future<DbResult<int>> createTransaction(model.Transaction value) async {
    try {
      final db = await _db;

      final id = await db.insert('transactions', value.toJson());

      return DbResult.success(id);
    } catch (e, st) {
      return DbResult.failure(e, st);
    }
  }

  Future<DbResult<List<model.Transaction>>> getTransactionList({
    DateTime? date,
  }) async {
    try {
      final db = await _db;

      final result = await db.rawQuery(
        '''
      SELECT 
          t.id AS id, t.amount, t.type, t.date, t.title, t.description, t.category_id,
          w.id AS wallet_id, w.name AS wallet_name, w.logo AS wallet_logo,
          c.id AS category_id, c.label AS category_label
          FROM transactions t
          LEFT JOIN wallets w ON t.wallet_id = w.id
          LEFT JOIN categories c ON t.category_id = c.id
          ORDER BY t.created_at;
      ''',
      );

      final formattedResult = result.map((row) {
        return {
          'id': row['id'],
          'amount': row['amount'],
          'type': row['type'],
          'date': row['date'],
          'title': row['title'],
          'description': row['description'],
          'category_id': row['category_id'],
          'wallet': {
            'id': row['wallet_id'],
            'name': row['wallet_name'],
            'logo': row['wallet_logo'],
          },
          'category': {
            'id': row['category_id'],
            'label': row['category_label'],
          },
        };
      }).toList();

      final list = formattedResult.map(model.Transaction.fromJson).toList();

      return DbResult.success(list);
    } catch (e, st) {
      return DbResult.failure(e, st);
    }
  }

  Future<void> deleteTransaction() async {}

  Future<int> updateTransaction({
    required int id,
    required String amount,
    required String title,
    required String date,
    required String description,
    required int walletId,
    required int categoryId,
    required TransactionType type,
  }) async {
    final db = await _db;

    final value = model.Transaction(
      id: id,
      amount: double.parse(amount),
      title: title,
      date: date,
      description: description,
      walletId: walletId,
      categoryId: categoryId,
      type: type.name,
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
