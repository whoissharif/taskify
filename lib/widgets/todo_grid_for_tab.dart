import 'package:flutter/material.dart';
import 'package:taskify/widgets/my_custom_app_bar.dart';
import 'package:taskify/widgets/todo_grid_tile.dart';

import '../features/todo/controllers/todo_controller.dart';
import 'loading_widget.dart';
import 'no_task.dart';

class TodoGridForTab extends StatelessWidget {
  const TodoGridForTab({
    Key? key,
    required this.todoProvider,
  }) : super(key: key);

  final TodoController todoProvider;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        MyCustomAppBar(todoProvider: todoProvider),
        todoProvider.isLoading
            ? const LoadingWidget()
            : todoProvider.todoCount != 0
                ? SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return TodoGridTile(
                          todoProvider: todoProvider,
                          index: index,
                        );
                      },
                      childCount: todoProvider.todos.length,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.2,
                    ),
                  )
                : const NoTask(),
      ],
    );
  }
}
