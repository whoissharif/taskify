import 'package:flutter/material.dart';
import '../todo/controllers/todo_controller.dart';
import '../../widgets/todo_tile.dart';

class CustomSearchDelegate extends SearchDelegate {
  final TodoController todoController;

  CustomSearchDelegate(this.todoController);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final todo = todoController.todos.where(
      (todo) {
        return todo.title.toLowerCase().contains(query.toLowerCase());
      },
    );
    return ListView.builder(
      itemCount: todo.length,
      itemBuilder: (context, index) {
        return TodoTile(todo: todo.elementAt(index));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final todo = todoController.todos.where(
      (todo) {
        return todo.title.toLowerCase().contains(query.toLowerCase());
      },
    );
    return ListView.builder(
      itemCount: todo.length,
      itemBuilder: (context, index) {
        return TodoTile(todo: todo.elementAt(index));
      },
    );
  }
}
