import 'package:flutter/material.dart';

import '../features/search/views/custom_search_deligate.dart';
import '../features/todo/controllers/todo_controller.dart';

class MyCustomAppBar extends StatelessWidget {
  const MyCustomAppBar({
    Key? key,
    required this.todoProvider,
  }) : super(key: key);

  final TodoController todoProvider;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          showSearch(
              context: context, delegate: CustomSearchDelegate(todoProvider));
        },
        icon: const Icon(
          Icons.search,
          color: Colors.red,
          size: 30,
        ),
      ),
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
    );
  }
}
