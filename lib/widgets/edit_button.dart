import 'package:flutter/material.dart';
import '../features/todo/controllers/todo_controller.dart';
import '../features/todo/models/todo.dart';
import '../utils/colors.dart';

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
