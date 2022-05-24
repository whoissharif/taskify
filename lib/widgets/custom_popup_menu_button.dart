import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../features/todo/controllers/todo_controller.dart';
import '../features/todo/models/todo.dart';
import '../features/todo/views/detail_screen.dart';
import '../utils/app_strings.dart';

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({
    Key? key,
    required this.todo,
    required this.todoProvider,
  }) : super(key: key);

  final Todo todo;
  final TodoController todoProvider;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
      itemBuilder: (_) => <PopupMenuItem<String>>[
        PopupMenuItem<String>(
            child: Text(
              todo.isDone ? AppStrings.markAsUnDone : AppStrings.markAsDone,
            ),
            value: 'done'),
        const PopupMenuItem<String>(
            child: Text(
              AppStrings.deleteButtonText,
            ),
            value: 'delete'),
        const PopupMenuItem(
          child: Text(AppStrings.editButtonText),
          value: 'edit',
        ),
      ],
      onSelected: (i) {
        switch (i) {
          case 'done':
            todoProvider.toggleDone(todo);
            Fluttertoast.showToast(
                msg: AppStrings.taskUpdate,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
            break;
          case 'delete':
            todoProvider.deleteTodo(todo.id);
            Fluttertoast.showToast(
                msg: AppStrings.taskDeleteMsg,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
            break;
          case 'edit':
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) {
                  return DetailScreen(todo: todo);
                },
              ),
            );
            break;
        }
      },
    );
  }
}
