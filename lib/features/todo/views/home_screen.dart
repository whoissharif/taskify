import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/features/todo/controllers/todo_controller.dart';
import 'package:taskify/features/todo/models/todo.dart';
import 'package:taskify/utils/colors.dart';
import '../../../widgets/add_todo_alert_dialog_content.dart';
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
    var todoController = Provider.of<TodoController>(context, listen: false);
    todoController.fetchTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var todoProvider = Provider.of<TodoController>(context, listen: true);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todoProvider.reset();
          showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  content: AddTodoAlertDialogContent(),
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              pinned: true,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: const Text(
                  'Taskify',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                background: Stack(
                  children: [
                    Image.asset(
                      'assets/images/bg-stars.png',
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/writing.png',
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ],
                ),
              ),
              expandedHeight: 200,
            ),
            todoProvider.isLoading
                ? const SliverToBoxAdapter(
                    child: Padding(
                    padding: EdgeInsets.only(top: 80.0),
                    child: Center(child: Text('Loading...')),
                  ))
                : todoProvider.todoCount != 0
                    ? SliverList(
                        delegate: SliverChildListDelegate(
                          List.generate(
                            todoProvider.todoCount,
                            (index) {
                              Todo todo = todoProvider.todos[index];
                              return TodoTile(
                                todo: todo,
                                index: index,
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
