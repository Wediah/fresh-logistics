import 'package:flutter/material.dart';
import 'package:freshlogistics/common/widgets/appbar/appbar.dart';
import 'package:freshlogistics/common/widgets/texts/section_heading.dart';
import 'package:freshlogistics/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:freshlogistics/utils/constants/sizes.dart';
import 'package:freshlogistics/utils/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FAppBar(title: Text('Profile'), showBackArrow: true),
      
      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              // Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppColors.primaryGreen,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    TextButton(onPressed: () {}, child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              // Details
              const SizedBox(height: Sizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: Sizes.spaceBtwItems),

              // Heading Profile Info
              const SectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: Sizes.spaceBtwItems),

              ProfileMenu(title: 'Name', value: 'Emmanuel Wediah', onPressed: () {}),
              ProfileMenu(title: 'Username', value: 'emmawediah', onPressed: () {}),

              const SizedBox(height: Sizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: Sizes.spaceBtwItems),

              // Heading Personal Info
              const SectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: Sizes.spaceBtwItems),

              ProfileMenu(title: 'User ID', value: '45689', icon: Icons.copy, onPressed: () {}),
              ProfileMenu(title: 'E-mail', value: 'emmawediah@example.com', onPressed: () {}),
              ProfileMenu(title: 'Phone Number', value: '+233-244-567-890', onPressed: () {}),
              ProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              ProfileMenu(title: 'Date of Birth', value: '10 Oct, 1994', onPressed: () {}),
              const Divider(),
              const SizedBox(height: Sizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Close Account', style: TextStyle(color: Colors.red)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
