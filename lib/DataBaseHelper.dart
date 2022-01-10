// ignore_for_file: file_names
import 'dart:async';
import 'package:path/path.dart';
import 'package:thetest/appClasses/note.dart';
//import 'appclasses/note.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  //person table
  String noteTable ="Notes";
  String id = "id" ;
  String title = "title" ;
  String image = "image";
  String description = "description" ;
  String date = "date" ;
  String time = "time" ;
  String status = "status" ;
  static DataBaseHelper? _databaseHelper;
  static Database? _database;
  DataBaseHelper._createInstance();

  // Named constructor to create instance of DatabaseHelper
  factory DataBaseHelper() =>
      _databaseHelper ??= DataBaseHelper._createInstance();

  Future<Database> get database async =>
      _database ??= await initializeDb();

  Future<Database> initializeDb() async {
    print("initDB executed");
    String path = join(await getDatabasesPath(), "Notes.db");
    await deleteDatabase(path);
    return await openDatabase(path, version: 2,
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE $noteTable($id Text,$title TEXT, $image TEXT, $description Text,  $date Text, $time Text, $status Text);");
        });
  }

  Future<List> viewAllNotes() async {
    final Database db = await database;
    var result = await db.rawQuery("SELECT $image FROM $noteTable");
    List allNames = [];
    for (var x in result) {
      x.forEach((k, v) => allNames.add(v));
    }
    allNames.toList();
    return allNames;
  }

  Future<List> viewAllTitles() async {
    final Database db = await database;
    var result = await db.rawQuery("SELECT $title FROM $noteTable");
    List allNames = [];
    for (var x in result) {
      x.forEach((k, v) => allNames.add(v));
    }
    allNames.toList();
    return allNames;
  }

  Future<List> viewAllIds() async {
    final Database db = await database;
    var result = await db.rawQuery("SELECT $id FROM $noteTable");
    List allNames = [];
    for (var x in result) {
      x.forEach((k, v) => allNames.add(v));
    }
    allNames.toList();
    return allNames;
  }

  Future<List> viewById(String id1) async {
    final Database db = await database;
    var result = await db.rawQuery("SELECT * FROM $noteTable WHERE $id == '$id1'");
    List allNames = [];
    for (var x in result) {
      x.forEach((k, v) => allNames.add(v));
    }
    allNames.toList();
    return allNames;
  }

  Future<void> deleteNote(String id1) async {
    final Database db = await database;
    await db.rawQuery("DELETE FROM $noteTable WHERE $id = '$id1';");
  }


  Future<void> insertNote(visualNote note) async {
    final Database db = await database;
    await db.insert(
      'Notes',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }
}
