import 'package:flutter/material.dart';

import '../features/todo/controllers/todo_controller.dart';
import '../features/todo/models/todo.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    Key? key,
    required this.todoController,
    required this.todo,
  }) : super(key: key);

  final TodoController todoController;
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          todoController.deleteTodo(todo.id);
          Navigator.of(context).pop();
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Text('Delete'),
        ),
      ),
    );
  }
}

