import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/widgets/color_selector_section.dart';
import 'package:taskify/widgets/todo_text_field.dart';
import '../features/todo/controllers/todo_controller.dart';

class AddTodoAlertDialogContent extends StatelessWidget {
  const AddTodoAlertDialogContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var todoProvider = Provider.of<TodoController>(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TodoTextField(
            todoController: todoProvider,
            autoFocus: true,
          ),
          const SizedBox(
            height: 10,
          ),
          ColorSelectorSection(todoController: todoProvider),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                todoProvider.titleController.text.isEmpty
                    ? todoProvider.setTodoTitleValidate(true)
                    : todoProvider.setTodoTitleValidate(false);
                if (todoProvider.todoTitleValidate) return;
                todoProvider.addTodo(todoProvider.titleController.text);
                todoProvider.titleController.clear();
                Navigator.of(context).pop();
              },
              child: const Text('Add Todo'),
            ),
          ),
        ],
      ),
    );
  }
}
