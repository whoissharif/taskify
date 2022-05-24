import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../features/onboarding/controllers/onboarding_controller.dart';

class Indicators extends StatelessWidget {
  const Indicators({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final OnboardingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        controller.onboardingPages.length,
        (index) => Container(
          margin: const EdgeInsets.all(4),
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: controller.selectedPageIndex == index
                ? AppColors.primary
                : Colors.grey,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
