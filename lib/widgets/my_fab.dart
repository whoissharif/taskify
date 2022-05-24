import 'package:flutter/material.dart';
import 'add_todo_alert_dialog_content.dart';
import '../features/todo/controllers/todo_controller.dart';

class MyFab extends StatelessWidget {
  const MyFab({
    Key? key,
    required this.todoProvider,
  }) : super(key: key);

  final TodoController todoProvider;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        todoProvider.reset();
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Center(child: Text('Add a new task')),
                content: AddTodoAlertDialogContent(),
              );
            });
      },
      child: const Icon(Icons.add),
    );
  }
}
