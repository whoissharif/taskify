import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../features/todo/controllers/todo_controller.dart';
import '../features/todo/views/detail_screen.dart';

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
                              'Completed',
                              style: TextStyle(
                                color: todoProvider.todoColors[todo.colorIndex],
                                fontSize: 12,
                              ),
                            ),
                          )
                        : const Text(
                            'Ongoing',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
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
                                        ? "Mark as Undone"
                                        : "Mark as done",
                                  ),
                                  value: 'done'),
                              const PopupMenuItem<String>(
                                  child: Text(
                                    "Delete",
                                  ),
                                  value: 'delete'),
                              const PopupMenuItem(
                                child: Text('Edit'),
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
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    DateFormat('dd/MM/yyyy hh:mm a').format(todo.date),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
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
