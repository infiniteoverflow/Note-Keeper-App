import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:notekeeper/models/notes.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;
  String noteTable = 'note_table';
  String colId = 'id';
  String colDate = 'date';
  String colTitle = 'title';
  String colDesc = 'description';
  String colPriority = 'priority';

  DatabaseHelper._createInstance();
  factory DatabaseHelper () {
    if(_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
  }

  void _createdb(Database db,int newVersion) async {
    await db.execute('CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colTitle TEXT,$colDesc TEXT,$colPriority INTEGER,$colDate TEXT');
  }

  //initialize database
  Future<Database> initializeDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';
    var notesDatabase = await openDatabase(path,version:1,onCreate:_createdb);
    return notesDatabase;
  }

  Future<Database> get database async {
    if(_database == null) {
      _database = await initializeDb();
    }
    return _database;
  }

  Future<List<Map<String,dynamic>>> getNoteMapList() async {
    Database db = await this.database;
    var result = await db.rawQuery('SELECT * FROM $noteTable ORDER BY $colPriority');
    return result;
  }

  //Inserting data
  Future<int> insertNote(Note note) async {
    Database db = await this.database;
    var result = await db.insert(noteTable, note.toMap());
    return result;
  }

  //Updating data
  Future<int> updateNote(Note note) async {
    Database db = await this.database;
    var result = await db.update(noteTable, note.toMap(),where: '$colId=?',whereArgs: [note.id]);
    return result;
  }

  //Deleting data
  Future<int> deleteNote(int id) async {
    Database db = await this.database;
    var result = await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
    return result;
  }

  //No. of Records
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String,dynamic>> x = await db.rawQuery('SELECT COUNT (*) FROM $noteTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }
}