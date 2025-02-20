import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:yanmii_wallet/src/common/data/models/local/wallet.dart';
import 'package:yanmii_wallet/src/common/data/sources/sources.dart';
import 'package:yanmii_wallet/src/features/wallet/presentation/wallet_controller.dart';
import 'package:yanmii_wallet/src/utils/helpers/database_helper.dart';

class WalletRepository {
  WalletRepository(this._databaseHelper);

  final DatabaseHelper _databaseHelper;
  Future<Database> get _db => _databaseHelper.database;

  Future<DbResult<List<Wallet>>> getWallets() async {
    try {
      final db = await _db;
      final result = await db.rawQuery('''
        SELECT 
          w.id,
          w.name,
          w.logo,
          COALESCE(
            SUM(
              CASE 
                WHEN t.type = 'income' THEN t.amount 
                WHEN t.type = 'transfer' AND w.id = t.dest_wallet_id THEN t.amount 
                ELSE -t.amount 
              END
            ), 
            0
          ) AS balance
        FROM 
          wallets w
          LEFT JOIN transactions t ON w.id = t.wallet_id OR w.id = t.dest_wallet_id
        GROUP BY 
          w.id, w.name, w.logo
        ORDER BY balance DESC
      ''');
      if (result.isNotEmpty) {
        return DbResult.success(result.map(Wallet.fromJson).toList());
      } else {
        return const DbResult.success([]);
      }
    } catch (error, stackTrace) {
      return DbResult.failure(error, stackTrace);
    }
  }

  Future<DbResult<int>> createWallet(Wallet wallet) async {
    try {
      final db = await _db;
      final result = await db.insert('wallets', wallet.toJson());
      return DbResult.success(result);
    } catch (error, stackTrace) {
      return DbResult.failure(error, stackTrace);
    }
  }

  Future<DbResult<int>> updateWallet(Wallet wallet) async {
    log('repo updateWallet $wallet');
    try {
      final db = await _db;
      final result = await db.update(
        'wallets',
        wallet.toJson(),
        where: 'id = ? ',
        whereArgs: [
          wallet.id,
        ],
      );
      return DbResult.success(result);
    } catch (error, stackTrace) {
      return DbResult.failure(error, stackTrace);
    }
  }

  Future<int> checkTransaction(int id) async {
    try {
      final db = await _db;
      final result = await db.query('transactions',
          where: 'wallet_id = ? OR dest_wallet_id = ?', whereArgs: [id, id]);
      return result.length;
    } catch (e) {
      rethrow;
    }
  }

  Future<DbResult<int>> deleteWallet(
    int id, {
    DeletionActions? action,
  }) async {
    final db = await _db;
    try {
      if (action == DeletionActions.hardDelete) {
        await hardDeleteTransactionbyWallet(id);
      } else if (action == DeletionActions.softDelete) {
        await softDeleteTransactionbyWallet(id);
      }

      final result =
          await db.delete('wallets', where: 'id = ? ', whereArgs: [id, id]);
      return DbResult.success(result);
    } catch (e, st) {
      log('$e == $st');
      return DbResult.failure(e, st);
    }
  }

  Future<int> hardDeleteTransactionbyWallet(int id) async {
    final db = await _db;
    try {
      final result = await db.delete(
        'transactions',
        where: 'wallet_id = ? OR dest_wallet_id = ? ',
        whereArgs: [id, id],
      );

      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> softDeleteTransactionbyWallet(int id) async {
    final db = await _db;
    try {
      final updateWalletId = await db.update(
        'transactions',
        {
          'wallet_id': null,
        },
        where: 'wallet_id = ?',
        whereArgs: [id],
      );

      final updateDestWalletId = await db.update(
        'transactions',
        {
          'dest_wallet_id': null,
        },
        where: 'dest_wallet_id = ?',
        whereArgs: [id],
      );

      return updateWalletId + updateDestWalletId;
    } catch (e) {
      rethrow;
    }
  }
}

final walletRepositoryProvider = Provider<WalletRepository>((ref) {
  return WalletRepository(ref.watch(databaseHelperProvider));
});
