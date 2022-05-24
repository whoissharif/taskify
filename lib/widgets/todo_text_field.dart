import 'package:flutter/material.dart';

import '../features/todo/controllers/todo_controller.dart';

class TodoTextField extends StatelessWidget {
  const TodoTextField({
    Key? key,
    required this.todoController,
  }) : super(key: key);

  final TodoController todoController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: todoController.titleController,
      maxLines: 3,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        filled: true,
        errorText:
            todoController.todoTitleValidate ? 'Field can\'t be empty' : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        fillColor: const Color.fromARGB(255, 217, 232, 240),
      ),
    );
  }
}