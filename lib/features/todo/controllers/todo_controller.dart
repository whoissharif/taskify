import 'package:flutter/cupertino.dart';
import 'package:taskify/utils/database_helper.dart';

import '../models/todo.dart';

class TodoController extends ChangeNotifier {
  DatabaseHelper databaseHelper = DatabaseHelper.instance;
  List<Todo> _todos = [];
  bool _isLoading = false;
  TextEditingController titleController = TextEditingController();

  List<Todo> get todos => [..._todos];

  bool get isLoading => _isLoading;

  int get todoCount => _todos.length;

  fetchTodos() async {
    _isLoading = true;
    var data = await databaseHelper.getTodos();
    _todos = data;
    _isLoading = false;
    notifyListeners();
  }

  addTodo(String newTodoTitle) {
    final todo = Todo(title: titleController.text, date: DateTime.now());
    databaseHelper.insertTodo(todo);
    fetchTodos();
  }
}
