import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHeleper {
  static Future<sql.Database> database() async {
    final String dbPath = await sql.getDatabasesPath();
    final sqlDb = await sql.openDatabase(path.join(dbPath, 'places.db'),
        onCreate: (db, version) async {
      return await db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY,title TEXT, image TEXT)');
    }, version: 2);
    print(sqlDb.isOpen);
    return sqlDb;
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    print("inserting ");
    final sqlDb = await DBHeleper.database();
    print("getting data $data");
    await sqlDb.insert(table, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    print("ending here");
  }

  static Future<List<Map<String, Object>>> getData(String table) async {
    final db = await DBHeleper.database();
    return db.query(table);
  }
}
