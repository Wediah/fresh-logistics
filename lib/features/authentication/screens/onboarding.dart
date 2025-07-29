import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:freshlogistics/utils/device/device_utility.dart';
import 'package:freshlogistics/utils/constants/image_strings.dart';
import 'package:freshlogistics/utils/constants/text_strings.dart';
import 'package:freshlogistics/utils/constants/sizes.dart';
import 'package:freshlogistics/features/authentication/controllers/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    final double cardHeight = 280.0;
    final isDark = DeviceUtility.isDarkMode(context);
    final activeColor = const Color(0xFF19530E);

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updateCurrentPageIndex,
            children: [
              _buildOnboardingPage(
                context,
                imagePath: ImageStrings.onboarding1,
                title: TextStrings.onboardingTitle1,
                subtitle: TextStrings.onboardingSubtitle1,
                cardHeight: cardHeight,
                currentIndex: 0,
                pageCount: 3,
              ),
              _buildOnboardingPage(
                context,
                imagePath: ImageStrings.onboarding2,
                title: TextStrings.onboardingTitle2,
                subtitle: TextStrings.onboardingSubtitle2,
                cardHeight: cardHeight,
                currentIndex: 1,
                pageCount: 3,
              ),
              _buildOnboardingPage(
                context,
                imagePath: ImageStrings.onboarding3,
                title: TextStrings.onboardingTitle3,
                subtitle: TextStrings.onboardingSubtitle3,
                cardHeight: cardHeight,
                currentIndex: 2,
                pageCount: 3,
                isLastPage: true,
              ),
            ],
          ),

          // Skip Button
          Obx(() => Visibility(
            visible: !controller.isLastPage,
            child: Positioned(
              top: MediaQuery.of(context).padding.top + Sizes.defaultSpace,
              right: Sizes.defaultSpace,
              child: Container(
                decoration: BoxDecoration(
                  color: isDark ? Colors.green[800] : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: controller.skipPage,
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: activeColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          )),

          // Centered Next Button
          Obx(() => Visibility(
            visible: !controller.isLastPage,
            child: Positioned(
              bottom: Sizes.defaultSpace * 2,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: activeColor,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: controller.nextPage,
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildOnboardingPage(
    BuildContext context, {
    required String imagePath,
    required String title,
    required String subtitle,
    required double cardHeight,
    required int currentIndex,
    required int pageCount,
    bool isLastPage = false,
  }) {
    final isDark = DeviceUtility.isDarkMode(context);
    final activeColor = const Color(0xFF19530E);

    return Stack(
      children: [
        // Full-screen background image
        SizedBox.expand(
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        
        // Content card
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: cardHeight,
            padding: const EdgeInsets.all(Sizes.defaultSpace),
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[850] : Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(Sizes.borderRadiusLg),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Page Indicators (dots)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(pageCount, (index) {
                    return Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == index 
                            ? activeColor
                            : isDark ? Colors.grey[600] : Colors.grey[300],
                      ),
                    );
                  }),
                ),

                // Text Content
                Column(
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: isDark ? Colors.white : Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: Sizes.spaceBtwItems),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isDark ? Colors.white : Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),

                // Get Started Button (only on last page)
                if (isLastPage)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: activeColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                      child: const Text(
                        'Get Started',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                else
                  const SizedBox(height: 48), // Spacer when no button
              ],
            ),
          ),
        ),
      ],
    );
  }
}