import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:yanmii_wallet/src/common/data/models/local/category_total.dart';
import 'package:yanmii_wallet/src/common/data/models/local/monthly_balance.dart';
import 'package:yanmii_wallet/src/common/data/models/local/transaction.dart'
    as model;
import 'package:yanmii_wallet/src/common/data/sources/sources.dart';
import 'package:yanmii_wallet/src/utils/helpers/database_helper.dart';

class TransactionRepository {
  TransactionRepository(this._databaseHelper);

  final DatabaseHelper _databaseHelper;
  Future<Database> get _db async => _databaseHelper.database;

  Future<DbResult<int>> createTransaction(model.Transaction value) async {
    try {
      final db = await _db;
      log('value.toJson() ${value.toJson()}');

      final id = await db.insert('transactions', value.toJson());

      return DbResult.success(id);
    } catch (e, st) {
      return DbResult.failure(e, st);
    }
  }

  Future<int?> getDateCounts() async {
    final db = await _db;
    final result = await db.rawQuery('''
      SELECT (julianday(DATE('now')) - julianday(DATE(MIN(date)))) + 1 AS days_diff
      FROM transactions;
    ''');

    if (result.isEmpty) return null;

    try {
      return (result.first['days_diff']! as double).toInt();
    } catch (e) {
      rethrow;
    }
  }

  Future<DbResult<List<model.Transaction>>> getTransactionList({
    DateTime? date,
  }) async {
    log('getTransactions ${date?.toIso8601String()}');
    try {
      final db = await _db;

      const query = '''
      SELECT 
          t.id AS id, t.amount, t.type, t.date, t.title, t.description, t.category_id,
          w.id AS wallet_id, w.name AS wallet_name, w.logo AS wallet_logo,
          dw.id AS dest_wallet_id, dw.name AS dest_wallet_name, dw.logo AS dest_wallet_logo,
          c.id AS category_id, c.label AS category_label
          FROM transactions t
          LEFT JOIN wallets w ON t.wallet_id = w.id
          LEFT JOIN wallets dw ON t.dest_wallet_id = dw.id
          LEFT JOIN categories c ON t.category_id = c.id
          WHERE DATE(date) = DATE(?)
          ORDER BY t.created_at;
      ''';
      final result = await db.rawQuery(
        query,
        [date?.toIso8601String()],
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
          if (row['wallet_id'] != null && row['wallet_name'] != null)
            'wallet': {
              'id': row['wallet_id'],
              'name': row['wallet_name'],
              'logo': row['wallet_logo'],
            },
          if (row['dest_wallet_id'] != null && row['dest_wallet_name'] != null)
            'dest_wallet': {
              'id': row['dest_wallet_id'],
              'name': row['dest_wallet_name'],
              'logo': row['dest_wallet_logo'],
            },
          if (row['category_id'] != null && row['category_label'] != null)
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

  Future<DbResult<int>> delete(int id) async {
    final db = await _db;

    try {
      final affected =
          await db.delete('transactions', where: 'id = ?', whereArgs: [id]);
      return DbResult.success(affected);
    } catch (e, st) {
      return DbResult.failure(e, st);
    }
  }

  Future<DbResult<int>> updateTransaction(model.Transaction value) async {
    try {
      final db = await _db;

      final id = await db.update(
        'transactions',
        value.toJson(),
        where: 'id = ?',
        whereArgs: [value.id],
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      return DbResult.success(id);
    } catch (e, st) {
      return DbResult.failure(e, st);
    }
  }

  Future<DbResult<List<MonthlyBalance>>> getMonthlyRecap() async {
    final db = await _db;
    try {
      final result = await db.rawQuery('''
        SELECT 
          CAST(STRFTIME('%Y', t.date) AS INT) AS year,
          CAST(STRFTIME('%m', t.date) AS INT) AS month, 
          SUM(CASE WHEN t.type = 'expense' AND t.amount > 0 THEN t.amount ELSE 0 END) AS total_expense,
          SUM(CASE WHEN t.type = 'income' AND t.amount > 0 THEN t.amount ELSE 0 END) AS total_income,
          SUM(CASE WHEN t.type = 'income' AND t.amount > 0 THEN t.amount ELSE 0 END) - 
          SUM(CASE WHEN t.type = 'expense' AND t.amount > 0 THEN t.amount ELSE 0 END) AS monthly_balance,
          (SELECT SUM(CASE WHEN t2.type = 'income' AND t2.amount > 0 THEN t2.amount ELSE 0 END) - 
                  SUM(CASE WHEN t2.type = 'expense' AND t2.amount > 0 THEN t2.amount ELSE 0 END) 
          FROM transactions t2 
          WHERE STRFTIME('%Y', t2.date) <= STRFTIME('%Y', t.date) AND 
                STRFTIME('%m', t2.date) <= STRFTIME('%m', t.date)) AS running_balance
        FROM 
          transactions t
        GROUP BY 
          STRFTIME('%Y', t.date), 
          STRFTIME('%m', t.date)
        ORDER BY 
          year, month;
      ''');

      log('result $result');

      final data = result.map(MonthlyBalance.fromJson).toList();

      return DbResult.success(data);
    } catch (e, st) {
      return DbResult.failure(e, st);
    }
  }

  Future<DbResult<List<CategoryTotal>>> getCategoryTotals(DateTime date) async {
    final db = await _db;
    log('getCategoryTotals $date');

    final query = '''
        SELECT 
          c.id AS id,
          c.label AS label, 
          SUM(t.amount) as total
        FROM 
          transactions t
          INNER JOIN categories c ON t.category_id = c.id
        WHERE 
          t.type == 'expense' AND
          STRFTIME('%Y-%m', t.date) = '${DateFormat('yyyy-MM').format(date)}'
        GROUP BY 
          c.id, c.label
          ''';

    log(query);

    try {
      final result = await db.rawQuery(
        query,
        [],
      );

      final categories = result.map(CategoryTotal.fromJson).toList();
      log('$categories ${categories.length}');

      return DbResult.success(categories);
    } catch (e, st) {
      log('getCategoryTotals $e', error: e, stackTrace: st);
      return DbResult.failure(e, st);
    }
  }
}

final transactionRepositoryProvider =
    Provider((ref) => TransactionRepository(ref.watch(databaseHelperProvider)));
