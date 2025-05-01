import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:yanmii_wallet/src/common/data/models/local/category_total.dart';
import 'package:yanmii_wallet/src/common/data/models/local/custom_balance.dart';
import 'package:yanmii_wallet/src/common/data/models/local/monthly_balance.dart';
import 'package:yanmii_wallet/src/common/data/models/local/title_total.dart';
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

      final formattedResult = result.map(_formatTransaction).toList();

      final list = formattedResult.map(model.Transaction.fromJson).toList();

      return DbResult.success(list);
    } catch (e, st) {
      return DbResult.failure(e, st);
    }
  }

  Future<DbResult<List<String>>> searchName(String keyword) async {
    final db = await _db;
    final result = await db.rawQuery(
      '''
      SELECT t.title, COUNT(*) as occurrence
      FROM transactions t
      WHERE t.title LIKE '%$keyword%'
      GROUP BY t.title
      ORDER BY occurrence DESC, t.title;
      ''',
      [keyword],
    );

    return DbResult.success(result.map((e) => e['title']! as String).toList());
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

  Future<DbResult<List<MonthlyBalance>>> getMonthlyRecaps({
    required int startDate,
  }) async {
    final db = await _db;
    try {
      // Calculate custom month periods based on startDate
      final query = '''
        WITH date_info AS (
          SELECT 
            date,
            type,
            amount,
            -- Extract the day from the date
            CAST(STRFTIME('%d', date) AS INT) AS day,
            -- Extract year and month
            CAST(STRFTIME('%Y', date) AS INT) AS year,
            CAST(STRFTIME('%m', date) AS INT) AS month,
            -- Calculate the custom month period
            CASE 
              -- If the day is less than startDate, it belongs to the previous month period
              WHEN CAST(STRFTIME('%d', date) AS INT) < $startDate THEN 
                -- Use the current month as the period
                CAST(STRFTIME('%Y', date) AS INT) * 100 + CAST(STRFTIME('%m', date) AS INT)
              -- If the day is >= startDate, it belongs to the current month period
              ELSE 
                -- Calculate next month (handling December to January transition)
                CASE 
                  WHEN CAST(STRFTIME('%m', date) AS INT) = 12 THEN 
                    (CAST(STRFTIME('%Y', date) AS INT) + 1) * 100 + 1
                  ELSE 
                    CAST(STRFTIME('%Y', date) AS INT) * 100 + (CAST(STRFTIME('%m', date) AS INT) + 1)
                END
            END AS custom_period
          FROM transactions
        )
        SELECT 
          custom_period / 100 AS year,
          custom_period % 100 AS month,
          SUM(CASE WHEN type = 'expense' AND amount > 0 THEN amount ELSE 0 END) AS total_expense,
          SUM(CASE WHEN type = 'income' AND amount > 0 THEN amount ELSE 0 END) AS total_income,
          SUM(CASE WHEN type = 'income' AND amount > 0 THEN amount ELSE 0 END) - 
          SUM(CASE WHEN type = 'expense' AND amount > 0 THEN amount ELSE 0 END) AS monthly_balance,
          -- For running balance, we need to calculate across all periods up to the current one
          (SELECT 
            SUM(CASE WHEN di2.type = 'income' AND di2.amount > 0 THEN di2.amount ELSE 0 END) - 
            SUM(CASE WHEN di2.type = 'expense' AND di2.amount > 0 THEN di2.amount ELSE 0 END)
           FROM date_info di2 
           WHERE di2.custom_period <= di.custom_period
          ) AS running_balance
        FROM 
          date_info di
        GROUP BY 
          custom_period
        ORDER BY 
          custom_period;
      ''';

      final result = await db.rawQuery(query);

      log('result $result');
      final data = result.map(MonthlyBalance.fromJson).toList();

      return DbResult.success(data);
    } catch (e, st) {
      return DbResult.failure(e, st);
    }
  }

  Future<DbResult<List<CustomBalance>>> getCustomRecaps() async {
    log('getCustomRecaps');
    final db = await _db;
    try {
      final list = <CustomBalance>[];
      final result = await db.rawQuery('''
        SELECT 
          * 
        FROM custom_recaps
        ORDER BY start_date;
      ''');

      for (final element in result) {
        const query = '''
          SELECT 
            *,
            SUM(CASE WHEN t.type = 'expense' AND t.amount > 0 THEN t.amount ELSE 0 END) AS total_expense,
            SUM(CASE WHEN t.type = 'income' AND t.amount > 0 THEN t.amount ELSE 0 END) AS total_income,
            SUM(CASE WHEN t.type = 'income' AND t.amount > 0 THEN t.amount ELSE 0 END) - 
            SUM(CASE WHEN t.type = 'expense' AND t.amount > 0 THEN t.amount ELSE 0 END) AS balance
          FROM transactions t
          WHERE t.date >= ? AND t.date <= ?
        ''';

        final result = (await db.rawQuery(query, [
          element['start_date'],
          element['end_date'],
        ]))
            .toList();

        final map = {
          'id': element['id']!,
          'start_date': element['start_date']!,
          'end_date': element['end_date']!,
          'title': element['title']!,
          'total_expense': result.first['total_expense']!,
          'total_income': result.first['total_income']!,
          'balance': result.first['balance']!,
        };

        log('result ${jsonEncode(map)}');

        final data = CustomBalance.fromJson(map);
        list.add(data);
      }

      return DbResult.success(list);
    } catch (e, st) {
      return DbResult.failure(e, st);
    }
  }

  Future<DbResult<int>> addCustomRecap(
    String title,
    DateTime startDate,
    DateTime endDate,
  ) async {
    final db = await _db;

    try {
      final result = await db.insert('custom_recaps', {
        'title': title,
        'start_date': startDate.toIso8601String(),
        'end_date': endDate.toIso8601String(),
      });

      return DbResult.success(result);
    } catch (e, st) {
      return DbResult.failure(e, st);
    }
  }

  Future<DbResult<CustomBalance>> getCustomRecapByRange({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final db = await _db;
    try {
      final result = await db.rawQuery(
        '''
        SELECT * FROM custom_recaps WHERE start_date = ? AND end_date = ?
        ''',
        [startDate.toIso8601String(), endDate.toIso8601String()],
      );

      final data = CustomBalance.fromJson(result.first);

      return DbResult.success(data);
    } catch (e, st) {
      return DbResult.failure(e, st);
    }
  }

  Future<DbResult<CustomBalance>> getDetailedRecapByRange({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final db = await _db;
    final query = '''
        SELECT 
          CAST(STRFTIME('%Y', t.date) AS INT) AS year,
          CAST(STRFTIME('%m', t.date) AS INT) AS month, 
          SUM(CASE WHEN t.type = 'expense' AND t.amount > 0 THEN t.amount ELSE 0 END) AS total_expense,
          SUM(CASE WHEN t.type = 'income' AND t.amount > 0 THEN t.amount ELSE 0 END) AS total_income,
          SUM(CASE WHEN t.type = 'income' AND t.amount > 0 THEN t.amount ELSE 0 END) - 
          SUM(CASE WHEN t.type = 'expense' AND t.amount > 0 THEN t.amount ELSE 0 END) AS balance,
          (SELECT SUM(CASE WHEN t2.type = 'income' AND t2.amount > 0 THEN t2.amount ELSE 0 END) - 
                  SUM(CASE WHEN t2.type = 'expense' AND t2.amount > 0 THEN t2.amount ELSE 0 END)
          FROM transactions t2 
          WHERE STRFTIME('%Y', t2.date) <= STRFTIME('%Y', t.date) AND 
                STRFTIME('%m', t2.date) <= STRFTIME('%m', t.date)) AS running_balance,
                
          '$startDate' AS start_date,
          '$endDate' AS end_date
        FROM 
          transactions t
        WHERE 
          t.date >= ? AND t.date <= ?
        GROUP BY 
          STRFTIME('%Y', t.date), 
          STRFTIME('%m', t.date)
        ORDER BY 
          year, month;
      ''';
    log('query $query \n ${startDate.toIso8601String()} ${endDate.toIso8601String()}');
    try {
      final result = await db.rawQuery(
        query,
        [startDate.toIso8601String(), endDate.toIso8601String()],
      );

      log('result.first ${result.first}');

      final data = CustomBalance.fromJson(result.first);

      return DbResult.success(data);
    } catch (e, st) {
      return DbResult.failure(e, st);
    }
  }

  Future<DbResult<List<CategoryTotal>>> getCategoryTotals({
    required DateTime startDateTime,
    DateTime? endDateTime,
  }) async {
    final db = await _db;
    endDateTime ??= DateTime(
      startDateTime.year,
      startDateTime.month + 1,
      startDateTime.day,
    );

    const query = '''
        SELECT 
          c.id AS id,
          c.label AS label, 
          SUM(t.amount) as total
        FROM 
          transactions t
          INNER JOIN categories c ON t.category_id = c.id
        WHERE 
          (t.type == 'expense' OR t.type == 'income') AND
          STRFTIME('%Y-%m-%d', t.date) >= ? AND
          STRFTIME('%Y-%m-%d', t.date) <= ?
        GROUP BY 
          c.id, c.label
          ''';

    log('query $query ${DateFormat('yyyy-MM-dd').format(startDateTime)} '
        'to ${DateFormat('yyyy-MM-dd').format(endDateTime)}');

    try {
      final result = await db.rawQuery(
        query,
        [
          DateFormat('yyyy-MM-dd').format(startDateTime),
          DateFormat('yyyy-MM-dd').format(endDateTime),
        ],
      );

      final categories = result.map(CategoryTotal.fromJson).toList();
      return DbResult.success(categories);
    } catch (e, st) {
      log('getCategoryTotals $e', error: e, stackTrace: st);
      return DbResult.failure(e, st);
    }
  }

  Future<DbResult<List<TitleTotal>>> getTitleTransactions({
    required DateTime startDateTime,
    DateTime? endDateTime,
  }) async {
    final db = await _db;

    final query = '''
        SELECT 
          t.id AS id,
          t.title AS title,
          SUM(t.amount) as total
        FROM 
          transactions t
        WHERE 
          t.type == 'expense' AND
          STRFTIME('%Y-%m', t.date) = '${DateFormat('yyyy-MM').format(startDateTime)}'
        GROUP BY t.title
          ''';

    try {
      final result = await db.rawQuery(
        query,
        [],
      );

      final titles = result.map(TitleTotal.fromJson).toList();
      log('$titles ${titles.length}');

      return DbResult.success(titles);
    } catch (e, st) {
      log('getCategoryTotals $e', error: e, stackTrace: st);
      return DbResult.failure(e, st);
    }
  }

  Future<DbResult<List<model.Transaction>>> getTransactionsByTitle(
    String title, {
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final db = await _db;
    endDate ??= DateTime(
      startDate?.year ?? startDate?.year ?? DateTime.now().year,
      (startDate?.month ?? startDate?.month ?? DateTime.now().month) + 1,
      startDate?.day ?? startDate?.day ?? DateTime.now().day,
    );
    try {
      const query = '''
       SELECT 
          t.id AS id, t.amount, t.type, t.date, t.title, t.description, t.category_id,
          w.id AS wallet_id, w.name AS wallet_name, w.logo AS wallet_logo,
          dw.id AS dest_wallet_id, dw.name AS dest_wallet_name, dw.logo AS dest_wallet_logo,
          c.id AS category_id, c.label AS category_label
          FROM transactions t
          LEFT JOIN wallets w ON t.wallet_id = w.id
          LEFT JOIN wallets dw ON t.dest_wallet_id = dw.id
          LEFT JOIN categories c ON t.category_id = c.id WHERE t.title = ? AND t.date >= ? AND t.date <= ?
        ''';
      log('query $query $title '
          '${startDate?.toIso8601String()} ${endDate.toIso8601String()}');
      final result = await db.rawQuery(
        query,
        [title, startDate?.toIso8601String(), endDate.toIso8601String()],
      );
      log('result $result');

      final formattedResult = result.map(_formatTransaction).toList();

      final list = formattedResult.map(model.Transaction.fromJson).toList();

      return DbResult.success(list);
    } catch (e, st) {
      return DbResult.failure(e, st);
    }
  }

  Future<DbResult<List<model.Transaction>>> getTransactionsByCategory(
    int categoryId, {
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final db = await _db;
    endDate ??= DateTime(
      startDate?.year ?? DateTime.now().year,
      (startDate?.month ?? DateTime.now().month) + 1,
      startDate?.day ?? DateTime.now().day,
    );
    try {
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
          WHERE t.category_id = ? AND t.date >= ? AND t.date <= ?
        ''';

      final result = await db.rawQuery(
        query,
        [categoryId, startDate?.toIso8601String(), endDate.toIso8601String()],
      );

      final formattedResult = result.map(_formatTransaction).toList();

      final list = formattedResult.map(model.Transaction.fromJson).toList();
      return DbResult.success(list);
    } catch (e, st) {
      return DbResult.failure(e, st);
    }
  }

  Future<model.Transaction?> getTransactionById(int id) async {
    final db = await _db;
    try {
      const query = '''
        SELECT 
          t.*, w.id AS wallet_id, w.name AS wallet_name, w.logo AS wallet_logo,
          dw.id AS dest_wallet_id, dw.name AS dest_wallet_name, dw.logo AS dest_wallet_logo,
          c.id AS category_id, c.label AS category_label
        FROM transactions t
        LEFT JOIN wallets w ON t.wallet_id = w.id
        LEFT JOIN wallets dw ON t.dest_wallet_id = dw.id
        LEFT JOIN categories c ON t.category_id = c.id
        WHERE t.id = ?
      ''';
      final result = await db.rawQuery(query, [id]);
      if (result.isEmpty) return null;

      final row = result.first;
      final formattedResult = _formatTransaction(row);
      return model.Transaction.fromJson(formattedResult);
    } catch (e, st) {
      log('Error getting transaction', error: e, stackTrace: st);
      return null;
    }
  }

  Map<String, dynamic> _formatTransaction(Map<String, dynamic> row) {
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
  }
}

final transactionRepositoryProvider =
    Provider((ref) => TransactionRepository(ref.watch(databaseHelperProvider)));
