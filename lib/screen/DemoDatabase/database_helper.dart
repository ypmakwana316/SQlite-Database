import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'user_table_model.dart';

class DataBaseHelper {
  static const int _version = 1;
  static const String _dbName = "User.db";

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async => await db.execute(
            "CREATE TABLE User (id INTEGER PRIMARY KEY , title TEXT NOT NULL , description TEXT NOT NULL);"),
        version: _version);
  }

  static Future<int> addNote(UserTable note) async {
    final db = await _getDB();
    return await db.insert("User", note.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }




  static Future<int> updateNote(UserTable note) async {
    final db = await _getDB();
    return await db.update("User", note.toJson(),
        where: 'id = ?',
        whereArgs: [note.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }



  static Future<int> deletNote(UserTable note) async {
    final db = await _getDB();
    return db.delete("User", where: 'id = ?', whereArgs: [note.id]);
  }

  static Future<List<UserTable>?> getAllNote() async {
    final db = await _getDB();

    final List<Map<String , dynamic>> maps = await db.query("User");

    if(maps.isEmpty){
      return null;
    }

    return List.generate(maps.length, (index) => UserTable.fromJson(maps[index]));
  }


}
