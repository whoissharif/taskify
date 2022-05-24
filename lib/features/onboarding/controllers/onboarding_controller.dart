import 'package:flutter/material.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_strings.dart';
import '../models/onboarding_info.dart';

class OnboardingController extends ChangeNotifier {
  var _selectedPageIndex = 0;
  PageController pageController = PageController();

  int get selectedPageIndex => _selectedPageIndex;

  set setSelectedPageIndex(int val) {
    _selectedPageIndex = val;
    notifyListeners();
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(AppAssets.onboardingImage1, AppStrings.onboardTitle1,
        AppStrings.onboardDescription1),
    OnboardingInfo(AppAssets.onboardingImage2, AppStrings.onboardTitle2,
        AppStrings.onboardDescription2),
    OnboardingInfo(AppAssets.onboardingImage3, AppStrings.onboardTitle3,
        AppStrings.onboardDescription3)
  ];
}
