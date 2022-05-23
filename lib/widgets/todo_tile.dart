import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../features/todo/controllers/todo_controller.dart';
import '../features/todo/models/todo.dart';
import '../features/todo/views/detail_screen.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    Key? key,
    required this.todo,
    required this.index,
  }) : super(key: key);

  final Todo todo;
  final int index;

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
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(8)),
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
                              Icons.done,
                              color: Colors.white,
                              size: 15,
                            )
                          : const Icon(
                              Icons.add_circle_outline,
                              color: Colors.white,
                              size: 15,
                            ),
                      const SizedBox(width: 8),
                      Text(
                        todo.isDone ? 'Completed' : 'Need To Do',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    todo.title,
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy hh:mm a').format(todo.date),
                  )
                ],
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 1,
              child: PopupMenuButton(
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  itemBuilder: (_) => <PopupMenuItem<String>>[
                        PopupMenuItem<String>(
                            child: Text(
                              todo.isDone ? "Mark as Undone" : "Mark as done",
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
            ),
          ],
        ),
      ),
    );
  }
}
