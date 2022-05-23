import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/features/todo/controllers/todo_controller.dart';
import 'package:taskify/features/todo/models/todo.dart';
import 'package:taskify/features/todo/views/detail_screen.dart';
import '../../../widgets/add_todo_alert_dialog_content.dart';

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
    final todoProvider = Provider.of<TodoController>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
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
            SliverList(
              delegate: SliverChildListDelegate(
                List.generate(
                  todoProvider.todoCount,
                  (index) {
                    Todo todo = todoProvider.todos[index];
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
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          todo.id.toString(),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          todo.title,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: const [
                                    Icon(Icons.event_available),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'date',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
