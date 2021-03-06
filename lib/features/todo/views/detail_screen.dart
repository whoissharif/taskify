import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/todo_controller.dart';
import '../../../helpers/responsive_widget.dart';
import '../../../widgets/color_selector_section.dart';
import '../../../widgets/delete_button.dart';
import '../../../widgets/edit_button.dart';
import '../../../widgets/todo_text_field.dart';
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
      var todoController = Provider.of<TodoController>(context, listen: false);

      todoController.setSelectedColorIndex(widget.todo.colorIndex);
      todoController.titleController.text = widget.todo.title;
      todoController.setTodoTitleValidate(false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final todoController = Provider.of<TodoController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
        backgroundColor: todoController.todoColors[widget.todo.colorIndex],
      ),
      body: ResponsiveWidget(
        mobile: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TodoTextField(
                todoController: todoController,
                autoFocus: false,
              ),
              const SizedBox(
                height: 30,
              ),
              ColorSelectorSection(todoController: todoController),
              const SizedBox(
                height: 30,
              ),
              EditButton(todoController: todoController, todo: widget.todo),
              const SizedBox(
                height: 20,
              ),
              DeleteButton(todoController: todoController, todo: widget.todo),
            ],
          ),
        ),
        tab: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TodoTextField(
                        todoController: todoController,
                        autoFocus: false,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ColorSelectorSection(
                        todoController: todoController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: EditButton(
                        todoController: todoController,
                        todo: widget.todo,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: DeleteButton(
                        todoController: todoController,
                        todo: widget.todo,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
