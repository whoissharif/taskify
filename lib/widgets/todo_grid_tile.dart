import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskify/utils/app_strings.dart';

import '../features/todo/controllers/todo_controller.dart';
import '../features/todo/views/detail_screen.dart';
import '../utils/app_text_styles.dart';

class TodoGridTile extends StatelessWidget {
  const TodoGridTile({
    Key? key,
    required this.todoProvider,
    required this.index,
  }) : super(key: key);

  final TodoController todoProvider;
  final int index;

  @override
  Widget build(BuildContext context) {
    var todo = todoProvider.todos[index];
    return Card(
      color: todoProvider.todoColors[todoProvider.todos[index].colorIndex],
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                        todo.isDone ? Icons.done_all : Icons.more_horiz,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                    const SizedBox(width: 8),
                    todo.isDone
                        ? Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white),
                            child: Text(
                              AppStrings.taskCompleted,
                              style: TextStyle(
                                color: todoProvider.todoColors[todo.colorIndex],
                                fontSize: 12,
                              ),
                            ),
                          )
                        : const Text(
                            AppStrings.taskOngoing,
                            style: AppTextStyle.subtitle1,
                          ),
                    const Spacer(),
                    PopupMenuButton(
                        icon: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                        itemBuilder: (_) => <PopupMenuItem<String>>[
                              PopupMenuItem<String>(
                                  child: Text(
                                    todo.isDone
                                        ? AppStrings.markAsUnDone
                                        : AppStrings.markAsDone,
                                  ),
                                  value: 'done'),
                              const PopupMenuItem<String>(
                                  child: Text(
                                    AppStrings.deleteButtonText,
                                  ),
                                  value: 'delete'),
                              const PopupMenuItem(
                                child: Text(AppStrings.editButtonText),
                                value: 'edit',
                              ),
                            ],
                        onSelected: (i) {
                          switch (i) {
                            case 'done':
                              todoProvider.toggleDone(todo);
                              break;
                            case 'delete':
                              todoProvider.deleteTodo(todo.id);
                              break;
                            case 'edit':
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) {
                                    return DetailScreen(todo: todo);
                                  },
                                ),
                              );
                              break;
                          }
                        }),
                  ],
                ),
                const Divider(
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      todo.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.title,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    DateFormat(AppStrings.appDateFormat).format(todo.date),
                    style: AppTextStyle.subtitle1,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
