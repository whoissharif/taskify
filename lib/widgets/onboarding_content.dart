import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../features/onboarding/controllers/onboarding_controller.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final OnboardingController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            controller.onboardingPages[index].title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          SvgPicture.asset(controller.onboardingPages[index].imageAsset,height: 400,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64.0),
            child: Text(
              controller.onboardingPages[index].description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
