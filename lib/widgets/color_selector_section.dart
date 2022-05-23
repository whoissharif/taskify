import 'package:flutter/material.dart';

import '../features/todo/controllers/todo_controller.dart';

class ColorSelectorSection extends StatelessWidget {
  const ColorSelectorSection({
    Key? key,
    required this.todoData,
  }) : super(key: key);

  final TodoController todoData;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: todoData.todoColors.map((e) {
        var index = todoData.todoColors.indexOf(e);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 3),
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
    );
  }
}
