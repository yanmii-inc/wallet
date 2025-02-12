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
      final result = await db.query('wallets');
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
}

final walletRepositoryProvider = Provider<WalletRepository>((ref) {
  return WalletRepository(ref.watch(databaseHelperProvider));
});
