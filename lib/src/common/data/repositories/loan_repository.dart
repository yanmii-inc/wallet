import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:yanmii_wallet/src/common/data/sources/sources.dart';
import 'package:yanmii_wallet/src/utils/helpers/database_helper.dart';
import 'package:yanmii_wallet/src/common/data/models/local/loan.dart';

class LoanRepository {
  LoanRepository(this._databaseHelper);

  final DatabaseHelper _databaseHelper;
  Future<Database> get _db async => _databaseHelper.database;

  Future<DbResult<List<Loan>>> getLoans() async {
    final db = await _db;
    try {
      final result = await db.query('loans');
      return DbResult.success(result.map(Loan.fromJson).toList());
    } catch (e, st) {
      return DbResult.failure(e, st);
    }
  }

  Future<int> add(Loan loan) async {
    final db = await _db;
    return db.insert('loans', loan.toJson());
  }

  Future<int> update(Loan loan) async {
    final db = await _db;
    return db
        .update('loans', loan.toJson(), where: 'id = ?', whereArgs: [loan.id]);
  }

  Future<int> delete(int id) async {
    final db = await _db;
    return db.delete('loans', where: 'id = ?', whereArgs: [id]);
  }
}

final loanRepositoryProvider = Provider<LoanRepository>(
    (ref) => LoanRepository(ref.watch(databaseHelperProvider)));
