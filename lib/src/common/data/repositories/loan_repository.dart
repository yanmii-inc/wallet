import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:yanmii_wallet/src/common/data/models/local/loan.dart';
import 'package:yanmii_wallet/src/common/data/models/local/loan_payment.dart';
import 'package:yanmii_wallet/src/common/data/sources/sources.dart';
import 'package:yanmii_wallet/src/utils/helpers/database_helper.dart';

class LoanRepository {
  LoanRepository(this._databaseHelper);

  final DatabaseHelper _databaseHelper;
  Future<Database> get _db async => _databaseHelper.database;

  Future<DbResult<List<Loan>>> getLoans() async {
    log('getLoans');
    final db = await _db;
    try {
      final result = await db.query('loans');
      return DbResult.success(result.map(Loan.fromJson).toList());
    } catch (e, st) {
      return DbResult.failure(e, st);
    }
  }

  Future<DbResult<Loan>> getLoanById(int id) async {
    final db = await _db;
    try {
      final result = await db.query(
        'loans',
        where: 'id = ?',
        whereArgs: [id],
      );
      return DbResult.success(Loan.fromJson(result.first));
    } catch (e, st) {
      return DbResult.failure(e, st);
    }
  }

  Future<DbResult<int>> add(Loan loan) async {
    final db = await _db;
    try {
      final result = await db.insert('loans', loan.toJson());
      return DbResult.success(result);
    } catch (e, st) {
      return DbResult.failure(e, st);
    }
  }

  Future<DbResult<int>> update(Loan loan) async {
    final db = await _db;
    try {
      return DbResult.success(
        await db.update(
          'loans',
          loan.toJson(),
          where: 'id = ?',
          whereArgs: [loan.id],
        ),
      );
    } catch (e, st) {
      return DbResult.failure(e, st);
    }
  }

  Future<DbResult<int>> delete(int id) async {
    final db = await _db;
    try {
      final result = await db.delete('loans', where: 'id = ?', whereArgs: [id]);
      return DbResult.success(result);
    } catch (e, st) {
      return DbResult.failure(e, st);
    }
  }

  Future<DbResult<int>> addPayment(LoanPayment payment) async {
    final db = await _db;
    try {
      final result = await db.insert('loan_payments', payment.toJson());
      return DbResult.success(result);
    } catch (e, st) {
      return DbResult.failure(e, st);
    }
  }

  Future<DbResult<int>> updatePayment(LoanPayment payment) async {
    final db = await _db;
    try {
      final result = await db.update(
        'loan_payments',
        payment.toJson(),
        where: 'id = ?',
        whereArgs: [payment.id],
      );
      return DbResult.success(result);
    } catch (e, st) {
      return DbResult.failure(e, st);
    }
  }

  Future<DbResult<List<LoanPayment>>> getPayments(int loanId) async {
    final db = await _db;
    try {
      final result = await db.query(
        'loan_payments',
        where: 'loan_id = ?',
        whereArgs: [loanId],
      );
      return DbResult.success(result.map(LoanPayment.fromJson).toList());
    } catch (e, st) {
      return DbResult.failure(e, st);
    }
  }

  Future<DbResult<LoanPayment>> getPaymentById(int id) async {
    final db = await _db;
    try {
      final result = await db.query(
        'loan_payments',
        where: 'id = ?',
        whereArgs: [id],
      );
      return DbResult.success(LoanPayment.fromJson(result.first));
    } catch (e, st) {
      return DbResult.failure(e, st);
    }
  }
}

final loanRepositoryProvider = Provider<LoanRepository>(
  (ref) => LoanRepository(ref.watch(databaseHelperProvider)),
);
