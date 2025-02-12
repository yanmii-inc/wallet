import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:yanmii_wallet/src/common/data/models/local/category.dart';
import 'package:yanmii_wallet/src/common/data/sources/sources.dart';
import 'package:yanmii_wallet/src/utils/helpers/database_helper.dart';

class CategoryRepository {
  CategoryRepository(this._databaseHelper);

  final DatabaseHelper _databaseHelper;
  Future<Database> get _db => _databaseHelper.database;

  Future<DbResult<List<Category>>> getCategories() async {
    try {
      final db = await _db;
      final result = await db.query('categories');
      if (result.isNotEmpty) {
        return DbResult.success(result.map(Category.fromJson).toList());
      } else {
        return const DbResult.success([]);
      }
    } catch (error, stackTrace) {
      return DbResult.failure(error, stackTrace);
    }
  }

  Future<DbResult<int>> createCategory(Category category) async {
    try {
      final db = await _db;
      final result = await db.insert('categories', category.toJson());
      return DbResult.success(result);
    } catch (error, stackTrace) {
      return DbResult.failure(error, stackTrace);
    }
  }
}

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepository(ref.watch(databaseHelperProvider));
});
