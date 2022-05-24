import 'package:flutter/material.dart';

class NoTask extends StatelessWidget {
  const NoTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 80.0),
        child: Center(
          child: Text(
            'No Task Added Yet',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
