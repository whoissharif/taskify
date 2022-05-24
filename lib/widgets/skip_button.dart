import 'package:flutter/material.dart';
import '../utils/app_strings.dart';
import '../features/todo/views/home_screen.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false);
      },
      child: const Text(AppStrings.skipButtonText),
    );
  }
}
