import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../features/onboarding/controllers/onboarding_controller.dart';
import '../features/todo/views/home_screen.dart';

class DoneButton extends StatelessWidget {
  const DoneButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final OnboardingController controller;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (controller.selectedPageIndex <
            controller.onboardingPages.length - 1) {
          controller.setSelectedPageIndex = controller.selectedPageIndex + 1;
          controller.pageController.animateToPage(
            controller.selectedPageIndex,
            duration:const Duration(microseconds: 600),
            curve: Curves.easeIn,
          );
        } else {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setInt('onBoard', 0);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (route) => false);
        }
      },
      child: Text(controller.selectedPageIndex == 2 ? 'Let\'s Go' : 'Next'),
    );
  }
}
