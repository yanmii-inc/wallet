import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:yanmii_wallet/src/common/data/models/local/wallet.dart';
import 'package:yanmii_wallet/src/common/data/sources/sources.dart';
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
}

final walletRepositoryProvider = Provider<WalletRepository>((ref) {
  return WalletRepository(ref.watch(databaseHelperProvider));
});
