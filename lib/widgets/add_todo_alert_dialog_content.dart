import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/widgets/color_selector_section.dart';

import '../features/todo/controllers/todo_controller.dart';

class AddTodoAlertDialogContent extends StatelessWidget {
  const AddTodoAlertDialogContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var todoProvider = Provider.of<TodoController>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          autofocus: true,
          controller: todoProvider.titleController,
        ),
        ColorSelectorSection(todoData: todoProvider),
        ElevatedButton(
          onPressed: () {
            todoProvider.addTodo(todoProvider.titleController.text);
            todoProvider.titleController.clear();
            Navigator.of(context).pop();
          },
          child: Text('Add Todo'),
        ),
      ],
    );
  }
}