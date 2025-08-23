import 'package:flutter/material.dart';
import 'package:freshlogistics/features/personalization/screens/settings/settings.dart';
import 'package:freshlogistics/features/shop/screens/home/home.dart';
import 'package:freshlogistics/features/shop/screens/store/store.dart';
import 'package:freshlogistics/features/shop/screens/wishlist/wishlist.dart';
import 'package:freshlogistics/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = HelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () =>  NavigationBar(
          height: 65,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? Colors.black : Colors.white,
          indicatorColor: const Color(0x1A19530E),
          destinations: [
            const NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
            const NavigationDestination(icon: Icon(Icons.store_mall_directory_outlined), label: 'Store'),
            const NavigationDestination(icon: Icon(Icons.favorite_border_outlined), label: 'Favorites'),
            const NavigationDestination(icon: Icon(Icons.person_2_outlined), label: 'Profile'),
          ]
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(), // Home Screen
    const StoreScreen(), // Store Screen
    const FavoriteScreen(), // Favorites Screen
    const SettingsScreen(), // Profile Screen
  ];
}