import 'package:flutter/material.dart';
import 'package:taskify/utils/app_strings.dart';
import 'package:taskify/utils/app_colors.dart';

import '../features/todo/controllers/todo_controller.dart';

class TodoTextField extends StatelessWidget {
  const TodoTextField({
    Key? key,
    required this.todoController,
    required this.autoFocus,
  }) : super(key: key);

  final TodoController todoController;
  final bool autoFocus;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: todoController.titleController,
      maxLines: 3,
      autofocus: autoFocus,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        filled: true,
        errorText: todoController.todoTitleValidate
            ? AppStrings.textFieldErrorMsg
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        fillColor: AppColors.textFieldFillColor,
      ),
    );
  }
}
