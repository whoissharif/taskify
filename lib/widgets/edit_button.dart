import 'package:flutter/material.dart';
import '../features/todo/controllers/todo_controller.dart';
import '../features/todo/models/todo.dart';
import '../utils/colors.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    Key? key,
    required this.todoData,
    required this.todo,
  }) : super(key: key);

  final TodoController todoData;
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          todoData.updateTodo(Todo(
            id: todo.id,
            title: todoData.titleController.text,
            //we can keep the previous date here but I am updating the date as the todo edited
            date: DateTime.now(),
            isDone: todo.isDone,
            colorIndex: todoData.selectedColorIndex,
          ));
          Navigator.of(context).pop();
        },
        style: ElevatedButton.styleFrom(
          primary: TaskifyColors.charcoal,
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Text('Edit'),
        ),
      ),
    );
  }
}
