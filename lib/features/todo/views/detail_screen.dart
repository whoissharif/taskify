import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/features/todo/controllers/todo_controller.dart';
import '../../../widgets/delete_button.dart';
import '../../../widgets/edit_button.dart';
import '../models/todo.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      log(widget.todo.colorIndex.toString());
      Provider.of<TodoController>(context, listen: false)
          .setSelectedColorIndex(widget.todo.colorIndex);
      Provider.of<TodoController>(context, listen: false).titleController.text =
          widget.todo.title;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final todoData = Provider.of<TodoController>(context);

    log(todoData.selectedColorIndex.toString());

   // todoData.titleController.text = widget.todo.title;

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
            Wrap(
              children: todoData.todoColors.map((e) {
                var index = todoData.todoColors.indexOf(e);
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
                  child: GestureDetector(
                    onTap: () {
                      todoData.setSelectedColorIndex(index);
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      child: Center(
                        child: todoData.selectedColorIndex == index
                            ? const Icon(
                                Icons.done,
                                size: 15,
                                color: Colors.white,
                              )
                            : null,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: todoData.todoColors[index],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 30,
            ),
            EditButton(todoData: todoData, todo: widget.todo),
            const SizedBox(
              height: 20,
            ),
            DeleteButton(todoData: todoData, todo: widget.todo),
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
