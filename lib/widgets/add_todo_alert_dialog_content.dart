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
        Wrap(
          children: todoProvider.todoColors.map((e) {
            var index = todoProvider.todoColors.indexOf(e);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
              child: GestureDetector(
                onTap: () {
                  todoProvider.setSelectedColorIndex(index);
                },
                child: Container(
                  height: 30,
                  width: 30,
                  child: Center(
                    child: todoProvider.selectedColorIndex == index
                        ? const Icon(
                            Icons.done,
                            size: 15,
                            color: Colors.white,
                          )
                        : null,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: todoProvider.todoColors[index],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
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
