import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shall_we_study_japanese/model/word_note.dart';
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

  insertWord(WordNote wordNote) async {
    final db = await database;
    var res = await db.insert(TABLE_NAME, wordNote.toJson());
    return res;
  }

  //Read
  getWord(int id) async {
    final db = await database;
    var res = await db.query(TABLE_NAME, where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? WordNote.fromJson(res.first) : Null;
  }

  //Read All
  Future<List<WordNote>> getAllWords() async {
    final db = await database;
    var res = await db.query(TABLE_NAME);
    List<WordNote> list = res.isNotEmpty ? res.map((c) => WordNote.fromJson(c)).toList() : [];

    return list;
  }

  updateWord(WordNote wordNote) async {
    final db = await database;
    var res = db.update(TABLE_NAME, wordNote.toJson(),
        where: 'id = ?', whereArgs: [wordNote.id]);
    return res;
  }

  //Delete
  deleteWord(int id) async {
    final db = await database;
    var res = db.delete(TABLE_NAME, where: 'id = ?', whereArgs: [id]);
    return res;
  }

  //Delete All
  deleteAllWordNote() async {
    final db = await database;
    db.delete(TABLE_NAME);
  }
}