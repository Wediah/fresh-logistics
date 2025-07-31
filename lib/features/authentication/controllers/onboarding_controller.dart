import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final PageController pageController = PageController();
  RxInt currentPageIndex = 0.obs;

  bool get isLastPage => currentPageIndex.value == 2;

  void updateCurrentPageIndex(int index) => currentPageIndex.value = index;

  void dotNavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void nextPage() {
    if (!isLastPage) {
      currentPageIndex.value++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _goToLoginScreen();
    }
  }

  void skipPage() {
    _goToLoginScreen();
  }

  void _goToLoginScreen() {
    Get.offAll(() => const LoginScreen());
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}