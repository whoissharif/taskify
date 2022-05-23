import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../features/todo/models/todo.dart';

class TodoDatabaseManager {
  TodoDatabaseManager._privateConstructor();
  static final TodoDatabaseManager instance =
      TodoDatabaseManager._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'todos.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE todos(
          id INTEGER PRIMARY KEY,
          title TEXT,
          date TEXT,
          iscomplete INTEGER
      )
      ''');
  }

  Future close() async {
    Database? db = await instance.database;
    db = null;
    return db!.close();
  }

  Future<void> insertTodo(Todo todo) async {
    Database db = await instance.database;
    await db.insert("todos", todo.toMap());
  }

  Future<List<Todo>> getTodos() async {
    Database db = await instance.database;
    var todos = await db.query("todos");

    List<Todo> todoList =
        todos.isNotEmpty ? todos.map((e) => Todo.fromMap(e)).toList() : [];
    return todoList;
  }

  Future<void> deleteTodo(int id) async {
    Database db = await instance.database;
    await db.delete(
      "todos",
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> updateTodo(Todo todo) async {
    Database db = await instance.database;
    await db
        .update("todos", todo.toMap(), where: 'id = ?', whereArgs: [todo.id]);
  }
}
