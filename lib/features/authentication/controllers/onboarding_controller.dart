import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final PageController pageController = PageController();
  RxInt currentPageIndex = 0.obs;

  // Getter to check if we're on last page
  bool get isLastPage => currentPageIndex.value == 2;

  // Update current page index when scroll
  void updateCurrentPageIndex(int index) {
    currentPageIndex.value = index;
  }

  // Jump to specific dot selected page
  void dotNavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // Update current page and jump to next page
  void nextPage() {
    if (!isLastPage) {
      currentPageIndex.value++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  // Update current page and jump to last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}