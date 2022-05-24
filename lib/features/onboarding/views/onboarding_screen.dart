import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/onboarding_controller.dart';
import '../../../widgets/done_button.dart';
import '../../../widgets/indicators.dart';
import '../../../widgets/onboarding_content.dart';
import '../../../widgets/skip_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<OnboardingController>(context, listen: true);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
              controller: controller.pageController,
              onPageChanged: (int page) {
                controller.setSelectedPageIndex = page;
              },
              itemCount: controller.onboardingPages.length,
              itemBuilder: (context, index) {
                return OnboardingContent(
                  controller: controller,
                  index: index,
                );
              }),
          Positioned(
            bottom: 20,
            child: Row(
              children: [
                const SkipButton(),
                const SizedBox(
                  width: 55,
                ),
                Indicators(controller: controller),
                const SizedBox(
                  width: 55,
                ),
                DoneButton(controller: controller),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
