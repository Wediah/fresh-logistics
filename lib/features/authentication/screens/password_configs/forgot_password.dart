import 'package:flutter/material.dart';
import 'package:freshlogistics/features/authentication/screens/password_configs/reset_password.dart';
import 'package:freshlogistics/utils/constants/sizes.dart';
import 'package:freshlogistics/utils/constants/text_strings.dart';
import 'package:get/get.dart';


class ForgotPasswordScreen extends StatelessWidget {

  const ForgotPasswordScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TextStrings.forgotPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: Sizes.spaceBtwItems),
              Text(TextStrings.forgotPasswordSubTitle, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: Sizes.spaceBtwSections * 2),

              TextFormField(
                decoration: InputDecoration(
                  labelText: TextStrings.emailHint, prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: Sizes.spaceBtwItems),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.off(() => const ResetPasswordScreen()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF19530E), // Background color
                    foregroundColor: Colors.white, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Border radius
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16), // Button padding
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}