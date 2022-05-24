import 'package:flutter/material.dart';
import 'package:taskify/helpers/database_helper.dart';

import '../models/todo.dart';

class TodoController extends ChangeNotifier {
  DatabaseHelper databaseHelper = DatabaseHelper.instance;
  List<Todo> _todos = [];
  bool _isLoading = false;
  TextEditingController titleController = TextEditingController();
  int _selectedColorIndex = 0;
  bool _todoTitleValidate = false;

  List<Todo> get todos => [..._todos];
  bool get isLoading => _isLoading;
  int get todoCount => _todos.length;
  int get selectedColorIndex => _selectedColorIndex;
  bool get todoTitleValidate => _todoTitleValidate;

  void setSelectedColorIndex(int val) {
    _selectedColorIndex = val;
    notifyListeners();
  }

  void setTodoTitleValidate(bool val) {
    _todoTitleValidate = val;
    notifyListeners();
  }

  void reset() {
    setSelectedColorIndex(0);
    titleController.text = '';
    setTodoTitleValidate(false);
  }

  fetchTodos() async {
    _isLoading = true;
    var data = await databaseHelper.getTodos();
    _todos = data;
    _isLoading = false;
    notifyListeners();
  }

  addTodo(String newTodoTitle) {
    final todo = Todo(
      title: titleController.text,
      date: DateTime.now(),
      colorIndex: _selectedColorIndex,
    );
    databaseHelper.insertTodo(todo);
    _selectedColorIndex = 0;

    fetchTodos();
  }

  void updateTodo(Todo todo) async {
    await databaseHelper.updateTodo(todo);
    _selectedColorIndex = 0;
    fetchTodos();
  }

  void toggleDone(Todo todo) async {
    todo.toggleDone();
    await databaseHelper.updateTodo(todo);
    notifyListeners();
  }

  void deleteTodo(int? id) {
    databaseHelper.deleteTodo(id!);
    fetchTodos();
  }

  List<Color> todoColors = [
    Colors.green,
    Colors.indigo,
    Colors.blue,
    Colors.purple,
    Colors.blueGrey,
    Colors.orangeAccent,
    Colors.pink,
    Colors.cyan,
    Colors.deepOrangeAccent,
    Colors.teal,
  ];
}
