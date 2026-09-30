import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDatabase {
  AppDatabase._privateConstructor();

  static final AppDatabase instance = AppDatabase._privateConstructor();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'sharb_business.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE products (
            id TEXT PRIMARY KEY,
            name TEXT NOT NULL,
            code TEXT,
            barcode TEXT,
            category TEXT,
            unit TEXT,
            purchase_price REAL NOT NULL,
            sale_price REAL NOT NULL,
            wholesale_price REAL NOT NULL,
            physical_stock INTEGER NOT NULL,
            reserved_stock INTEGER NOT NULL,
            sold_quantity INTEGER NOT NULL,
            minimum_stock INTEGER NOT NULL,
            image_path TEXT,
            supplier_id TEXT,
            description TEXT
          )
        ''');
      },
    );
  }
}