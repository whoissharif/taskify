import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/features/todo/controllers/todo_controller.dart';

import '../models/todo.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    final todoData = Provider.of<TodoController>(context);
    todoData.titleController.text = todo.title;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: todoData.titleController,
          ),
          ElevatedButton(
            onPressed: () {
              todoData.updateTodo(Todo(
                id: todo.id,
                title: todoData.titleController.text,
                date: DateTime.now(),
                isDone: todo.isDone,
              ));
              Navigator.of(context).pop();
            },
            child: const Text('Edit'),
          ),
        ],
      ),
    );
  }
}
