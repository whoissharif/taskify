import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/features/todo/controllers/todo_controller.dart';
import '../../../widgets/color_selector_section.dart';
import '../../../widgets/delete_button.dart';
import '../../../widgets/edit_button.dart';
import '../models/todo.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    final todoData = Provider.of<TodoController>(context);
    todoData.titleController.text = todo.title;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TodoTextField(todoData: todoData),
            const SizedBox(
              height: 30,
            ),
            ColorSelectorSection(todoData: todoData),
            const SizedBox(
              height: 30,
            ),
            EditButton(todoData: todoData, todo: todo),
            const SizedBox(
              height: 20,
            ),
            DeleteButton(todoData: todoData, todo: todo),
          ],
        ),
      ),
    );
  }
}

class TodoTextField extends StatelessWidget {
  const TodoTextField({
    Key? key,
    required this.todoData,
  }) : super(key: key);

  final TodoController todoData;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: todoData.titleController,
      maxLines: 3,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        filled: true,
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
