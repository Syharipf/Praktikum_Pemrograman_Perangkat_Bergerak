import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DBHelper {
  static final DBHelper _instance = DBHelper._init();
  static Database? _database;

  DBHelper._init();

  factory DBHelper() {
    return _instance;
  }

  Future<Database> db() async {
    if (_database != null) return _database!;

    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, "tp_mod10.db");

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return createTable(db);
      },
    );

    return _database!;
  }

  Future<void> createTable(Database db) async {
    await db.execute("""
      CREATE TABLE items (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        description TEXT,
        created_at TEXT
      );
    """);
  }

  Future<int> addItem(String title, String description) async {
    final database = await db();
    return await database.insert("items", {
      "title": title,
      "description": description,
      "created_at": DateTime.now().toString(),
    });
  }

  Future<List<Map<String, dynamic>>> readItem() async {
    final database = await db();
    return await database.query("items", orderBy: "id DESC");
  }
}
