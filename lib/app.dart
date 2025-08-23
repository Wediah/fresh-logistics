import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:freshlogistics/features/authentication/screens/onboarding.dart';
import 'package:freshlogistics/utils/theme/theme.dart';
import 'package:freshlogistics/features/shop/controllers/cart_controller.dart';
import 'package:freshlogistics/features/shop/controllers/product_controller.dart';

/// Use this Class to setup themes, initial Bindings, any animations and much more.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controllers
    Get.put(CartController());
    Get.put(ProductController());
    
    return GetMaterialApp(
      title: 'Fresh Logistics',
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
    );
  }
}