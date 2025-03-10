import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = 'pocketlog.db';
  static const _databaseVersion = 8;

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, _databaseName);

    log('database path: $path');

    return openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE transactions (
            id INTEGER PRIMARY KEY,
            date TEXT,
            wallet_id INTEGER,
            dest_wallet_id INTEGER,
            amount REAL NOT NULL,
            title REAL NOT NULL,
            category_id INTEGER,
            description TEXT,
            type TEXT,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            FOREIGN KEY(wallet_id) REFERENCES wallets(id),
            FOREIGN KEY(category_id) REFERENCES categories(id)
          );

        ''');

        await db.execute('''
          CREATE TABLE wallets (
            id INTEGER PRIMARY KEY,
            name TEXT NOT NULL,
            logo TEXT
          );
        ''');

        await db.execute('''
          CREATE TABLE categories (
            id INTEGER PRIMARY KEY,
            label TEXT NOT NULL
          )
        ''');
        await _seedDatabase(db);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 7) {
          await db.execute('''
            ALTER TABLE transactions
            ADD COLUMN dest_wallet_id INTEGER
          ''');
        }

        if (oldVersion < 8) {
          await db.execute('''
            CREATE TABLE custom_recaps (
              id INTEGER PRIMARY KEY,
              title TEXT NOT NULL,
              start_date TEXT NOT NULL,
              end_date TEXT NOT NULL 
            )
          ''');
        }
      },
    );
  }

  Future<void> _seedDatabase(Database db) async {
    log('seeed database');
    final wallets = [
      {'name': 'Uang Tunai'},
      {'name': 'BCA'},
      {'name': 'Mandiri'},
      {'name': 'BRI'},
      {'name': 'BNI'},
      {'name': 'BSI'},
      {'name': 'Jeniu'},
      {'name': 'CIMB'},
      {'name': 'OVO'},
      {'name': 'Gopay'},
      {'name': 'Dana'},
      {'name': 'LinkAja'},
    ];

    final batch = db.batch();
    for (final wallet in wallets) {
      batch.insert('wallets', wallet);
    }
    await batch.commit();

    // Insert some sample categories
    final categories = [
      {'label': 'Penghasilan'},
      {'label': 'Pengeluaran'},
      {'label': 'Makanan'},
      {'label': 'Transportasi'},
      {'label': 'Hiburan'},
      {'label': 'Belanja'},
      {'label': 'Kesehatan'},
      {'label': 'Pendidikan'},
    ];

    final batch2 = db.batch();
    for (final category in categories) {
      batch2.insert('categories', category);
    }
    await batch2.commit();
  }
}

final databaseHelperProvider =
    Provider<DatabaseHelper>((ref) => DatabaseHelper());
