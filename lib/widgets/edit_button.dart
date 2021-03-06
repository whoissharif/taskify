import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utils/app_strings.dart';
import '../features/todo/controllers/todo_controller.dart';
import '../features/todo/models/todo.dart';
import '../features/todo/views/home_screen.dart';
import '../utils/app_colors.dart';

class EditButton extends StatelessWidget {
  const EditButton({
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
          todoController.titleController.text.isEmpty
              ? todoController.setTodoTitleValidate(true)
              : todoController.setTodoTitleValidate(false);
          if (todoController.todoTitleValidate) return;
          todoController.updateTodo(Todo(
            id: todo.id,
            title: todoController.titleController.text,
            //we can keep the previous date here but I am updating the date as the todo edited
            date: DateTime.now(),
            isDone: todo.isDone,
            colorIndex: todoController.selectedColorIndex,
          ));
          todoController.titleController.clear();

          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (route) => false);
          Fluttertoast.showToast(
              msg: AppStrings.taskEditMsg,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        },
        style: ElevatedButton.styleFrom(
          primary: AppColors.charcoal,
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Text(AppStrings.editButtonText),
        ),
      ),
    );
  }
}
