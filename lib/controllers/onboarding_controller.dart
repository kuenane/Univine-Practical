import 'package:flutter/material.dart';
import 'package:onboardingdemo/models/onboardinginfo.dart';
import 'package:get/state_manager.dart';
//import 'package:get/utils.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  bool get isFirstPage => selectedPageIndex.value == 0;
  var pageController = PageController();

  buttonEventAction() {
    if (!isLastPage) {
      pageController.animateToPage(pageController.page!.toInt() + 1,
          duration: Duration(milliseconds: 400), curve: Curves.easeIn);
    }
  }

  backButtonAction() {
    if (!isFirstPage) {
      pageController.animateToPage(pageController.page!.toInt() - 1,
          duration: Duration(milliseconds: 400), curve: Curves.easeIn);
    }
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/order.png', '1', 'This is the first page.'),
    OnboardingInfo('assets/cook.png', '2', 'This is the second page.'),
    OnboardingInfo('assets/deliver.png', 'Upload images',
        'This is where you upload your files.')
  ];
}
