import 'package:flutter/material.dart';
import '../features/todo/controllers/todo_controller.dart';

class ColorSelectorSection extends StatelessWidget {
  const ColorSelectorSection({
    Key? key,
    required this.todoController,
  }) : super(key: key);

  final TodoController todoController;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: todoController.todoColors.map((e) {
        var index = todoController.todoColors.indexOf(e);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
          child: GestureDetector(
            onTap: () {
              todoController.setSelectedColorIndex(index);
            },
            child: Container(
              height: 30,
              width: 30,
              child: Center(
                child: todoController.selectedColorIndex == index
                    ? const Icon(
                        Icons.done,
                        size: 15,
                        color: Colors.white,
                      )
                    : null,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: todoController.todoColors[index],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
