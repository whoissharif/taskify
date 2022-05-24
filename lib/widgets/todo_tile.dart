import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../utils/app_strings.dart';
import '../utils/app_text_styles.dart';
import 'custom_popup_menu_button.dart';

import '../features/todo/controllers/todo_controller.dart';
import '../features/todo/models/todo.dart';
import '../features/todo/views/detail_screen.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    Key? key,
    required this.todo,
  }) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    var todoProvider = Provider.of<TodoController>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) {
              return DetailScreen(
                todo: todo,
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: todoProvider.todoColors[todo.colorIndex],
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      todo.isDone
                          ? const Icon(
                              Icons.done_all,
                              color: Colors.white,
                              size: 15,
                            )
                          : const Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                              size: 15,
                            ),
                      const SizedBox(width: 8),
                      todo.isDone
                          ? Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white),
                              child: Text(
                                AppStrings.taskCompleted,
                                style: TextStyle(
                                  color:
                                      todoProvider.todoColors[todo.colorIndex],
                                  fontSize: 12,
                                ),
                              ),
                            )
                          : const Text(
                              AppStrings.taskOngoing,
                              style: AppTextStyle.subtitle1,
                            ),
                    ],
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    todo.title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.title,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    DateFormat(AppStrings.appDateFormat).format(todo.date),
                    style: AppTextStyle.subtitle1,
                  )
                ],
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 1,
              child:
                  CustomPopupMenuButton(todo: todo, todoProvider: todoProvider),
            ),
          ],
        ),
      ),
    );
  }
}
