import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:yanmii_wallet/src/common/data/models/local/category.dart';
import 'package:yanmii_wallet/src/common/data/sources/sources.dart';
import 'package:yanmii_wallet/src/utils/helpers/database_helper.dart';

class CategoryRepository {
  CategoryRepository(this._databaseHelper);

  final DatabaseHelper _databaseHelper;
  Future<Database> get _db => _databaseHelper.database;

  Future<DbResult<List<Category>>> getCategories({String? keyword}) async {
    try {
      final db = await _db;

      late List<Map<String, dynamic>> result;

      log('getCategories: $keyword');

      if (keyword != null) {
        result = await db.rawQuery(
          'SELECT * FROM categories WHERE label LIKE "%$keyword%"',
        );
      } else {
        result = await db.query('categories');
      }

      if (result.isNotEmpty) {
        return DbResult.success(result.map(Category.fromJson).toList());
      } else {
        return const DbResult.success([]);
      }
    } catch (error, stackTrace) {
      return DbResult.failure(error, stackTrace);
    }
  }

  Future<DbResult<int>> insert(Category category) async {
    try {
      final db = await _db;
      final result = await db.insert('categories', category.toJson());
      return DbResult.success(result);
    } catch (error, stackTrace) {
      return DbResult.failure(error, stackTrace);
    }
  }

  Future<DbResult<void>> insertAll(List<Category> categories) async {
    try {
      final db = await _db;
      final batch = db.batch();
      
      for (final category in categories) {
        batch.insert('categories', {
          'label': category.label,
          'cloud_id': category.cloudId,
          'user_id': category.userId,
          'updated_at': category.updatedAt?.toIso8601String(),
        });
      }
      
      await batch.commit(noResult: true);
      return const DbResult.success(null);
    } catch (e, st) {
      return DbResult.failure(e, st);
    }
  }

  Future<DbResult<List<Category>>> searchSuggestedCategories(
    String keyword,
  ) async {
    log('searchSuggestedCategories: $keyword');
    try {
      final db = await _db;
      final result = await db.rawQuery(
        '''
         SELECT DISTINCT c.*, COUNT(t.id) as transaction_count 
          FROM categories c
          INNER JOIN transactions t ON t.category_id = c.id
          WHERE t.title LIKE ?
          GROUP BY c.id
          ORDER BY transaction_count DESC
        ''',
        ['%$keyword%'],
      );
      log('searchSuggestedCategories result: $result');
      return DbResult.success(result.map(Category.fromJson).toList());
    } catch (error, stackTrace) {
      log(
        'searchSuggestedCategories error',
        error: error,
        stackTrace: stackTrace,
      );
      return DbResult.failure(error, stackTrace);
    }
  }
}

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepository(ref.watch(databaseHelperProvider));
});
