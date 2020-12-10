import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final String TABLE_NAME = 'word_note';

class DB {
  DB._();

  static final DB _db = DB._();
  factory DB() => _db;

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDB();
    return _database;
  }

  _initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'Diary.db');

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute( // Table 생성
          'CREATE TABLE $TABLE_NAME ('
              'id INTEGER PRIMARY KEY, '
              'original_word TEXT, '
              'translation_word TEXT, '
              'memo TEXT'
              ')');
    }, onUpgrade: (db, oldVersion, newVersion) {});
  }
}