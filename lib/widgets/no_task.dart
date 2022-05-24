import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoTask extends StatelessWidget {
  const NoTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 120.0),
        child: Center(
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/images/no data.svg',
                height: 120,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'No Task Added Yet',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
