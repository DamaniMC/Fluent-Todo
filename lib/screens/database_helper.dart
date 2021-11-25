// Avoid errors caused by flutter upgrade.
import 'package:fluent_todo/models/task.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'tasks_database.db'),
      onCreate: (db, version) async {
        return db.execute(
            "CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, description TEXT)");
      },
      version: 1,
    );
  }

  Future<void> insertTask(Task task) async {
    Database db = await database();

    await db.insert(
      "tasks",
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Task>> getTasks() async {
    Database db = await database();
    final List<Map<String, dynamic>> maps = await db.query("tasks");
    return List.generate(maps.length, (index) {
      return Task(
        id: maps[index]['id'],
        title: maps[index]['title'],
        description: maps[index]['description'],
      );
    });
  }

  Future<void> updateTask(Task task) async {
    Database db = await database();
    await db.update(
      'tasks',
      task.toMap(),
      where: 'id=?',
      whereArgs: [task.id],
    );
  }

  Future<List<String>> displayTasks() async {
    Database db = await database();
    final List<Map<String, dynamic>> maps = await db.query("tasks");
    return List.generate(maps.length, (index) {
      return Task(
        id: maps[index]['id'],
        title: maps[index]['title'],
        description: maps[index]['description'],
      ).toString();
    });
  }

  Future<void> deleteTask(int id) async {
    Database db = await database();

    await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
