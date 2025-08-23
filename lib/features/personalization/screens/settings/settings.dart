import 'package:flutter/material.dart';
import 'package:freshlogistics/common/widgets/appbar/appbar.dart';
import 'package:freshlogistics/common/widgets/success_screen/custom_shapes/containers/primary_header_container.dart';
import 'package:freshlogistics/common/widgets/texts/section_heading.dart';
import 'package:freshlogistics/features/authentication/screens/login/login.dart';
import 'package:freshlogistics/features/personalization/screens/profile/profile.dart';
import 'package:freshlogistics/features/personalization/screens/settings/widgets/settings_menu_tile.dart';
import 'package:freshlogistics/features/personalization/screens/settings/widgets/user_profile_tile.dart';
import 'package:freshlogistics/features/shop/screens/admin/admin_panel.dart';
import 'package:freshlogistics/utils/constants/colors.dart';
import 'package:freshlogistics/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  FAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: AppColors.white))),
                  
                  // User Profile Card
                  UserProfileTile(onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: Sizes.spaceBtwSections),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(Sizes.defaultSpace),
              child: Column(
                children: [
                  // Account Settings
                  const SectionHeading(title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: Sizes.spaceBtwItems),

                  SettingsMenuTile(
                    icon: Icons.home,
                    title: 'My Addresses',
                    subTitle: 'Set shopping delivery address',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Icons.shopping_cart,
                    title: 'My Cart',
                    subTitle: 'Add, remove products and move to checkout',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Icons.shopping_bag,
                    title: 'My Orders',
                    subTitle: 'In-progress and Completed Orders',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Icons.account_balance_wallet,
                    title: 'Bank Account',
                    subTitle: 'Withdraw balance to registered bank account',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Icons.discount,
                    title: 'My Coupons',
                    subTitle: 'List of all the discounted coupons',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Icons.notifications,
                    title: 'Notifications',
                    subTitle: 'Set any kind of notification message',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Icons.security,
                    title: 'Account Privacy',
                    subTitle: 'Manage data usage and connected accounts',
                    onTap: () {},
                  ),

                  // App Settings
                  const SizedBox(height: Sizes.spaceBtwSections),
                  const SectionHeading(title: 'App Settings', showActionButton: false),
                  const SizedBox(height: Sizes.spaceBtwItems),
                  SettingsMenuTile(
                    icon: Icons.file_upload,
                    title: 'Load Data',
                    subTitle: 'Upload Data to your Cloud Storage',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Icons.admin_panel_settings,
                    title: 'Admin Panel',
                    subTitle: 'Manage products and categories in Firebase',
                    onTap: () => Get.to(() => const AdminPanel()),
                  ),
                  SettingsMenuTile(
                    icon: Icons.location_on,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  SettingsMenuTile(
                    icon: Icons.security,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  SettingsMenuTile(
                    icon: Icons.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  // Logout Button
                  const SizedBox(height: Sizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        Get.offAll(() => const LoginScreen());
                      },
                      child: const Text('Logout'),
                    ),
                  ),
                  const SizedBox(height: Sizes.spaceBtwSections * 2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
