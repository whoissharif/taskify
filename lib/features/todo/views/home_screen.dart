import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskify/features/todo/controllers/todo_controller.dart';
import 'package:taskify/features/todo/models/todo.dart';
import '../../../widgets/loading_widget.dart';
import '../../../widgets/my_custom_app_bar.dart';
import '../../../widgets/my_fab.dart';
import '../../../widgets/no_task.dart';
import '../../../widgets/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<TodoController>(context, listen: false).fetchTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var todoProvider = Provider.of<TodoController>(context, listen: true);
    return Scaffold(
      floatingActionButton: MyFab(todoProvider: todoProvider),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            MyCustomAppBar(todoProvider: todoProvider),
            todoProvider.isLoading
                ? const LoadingWidget()
                : todoProvider.todoCount != 0
                    ? SliverList(
                        delegate: SliverChildListDelegate(
                          List.generate(
                            todoProvider.todoCount,
                            (index) {
                              Todo todo = todoProvider.todos[index];
                              return TodoTile(
                                todo: todo,
                              );
                            },
                          ),
                        ),
                      )
                    : const NoTask(),
          ],
        ),
      ),
    );
  }
}
