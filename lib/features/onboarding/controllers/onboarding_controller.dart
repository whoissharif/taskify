import 'package:flutter/material.dart';
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
    OnboardingInfo('assets/images/todolist.svg', 'Manage Your Task',
        'Now you can manage your daily tasks easily.'),
    OnboardingInfo('assets/images/checklist.svg', 'Update Task',
        'Editing and updating is easier.'),
    OnboardingInfo('assets/images/search.svg', 'Search Task',
        'Find task easily with seaching')
  ];
}
