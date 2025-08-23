import 'package:flutter/material.dart';
import 'package:freshlogistics/features/authentication/screens/password_configs/forgot_password.dart';
import 'package:freshlogistics/features/authentication/screens/registration/register.dart';
import 'package:iconsax/iconsax.dart';
import 'package:freshlogistics/utils/constants/image_strings.dart';
import 'package:get/get.dart';
import 'package:freshlogistics/utils/constants/sizes.dart';
import 'package:freshlogistics/navigation_menu.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool agreeToTerms = false;
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with gradient background
            Container(
              width: double.infinity,
              height: 344,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: AssetImage(ImageStrings.authBackground),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  // Back button
                  // Positioned(
                  //   left: 16,
                  //   top: 60,
                  //   child: GestureDetector(
                  //     onTap: () => Navigator.pop(context),
                  //     child: Row(
                  //       children: [
                  //         const Icon(Icons.arrow_back, color: Colors.white),
                  //         const SizedBox(width: 4),
                  //         Text(
                  //           'Back',
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontSize: 14,
                  //             fontFamily: 'Inter',
                  //             fontWeight: FontWeight.w600,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  
                  // Title and subtitle
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 240),
                        Text(
                          'FreshLogistics',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Log into your account',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Form fields
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Email field
                  Text(
                    'Email Address',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 46,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xFFB3BCB2),
                        width: 1,
                      ),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        border: InputBorder.none,
                        hintText: 'Enter your email',
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Password field
                  Text(
                    'Password',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 46,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xFFB3BCB2),
                        width: 1,
                      ),
                    ),
                    child: TextField(
                      obscureText: obscurePassword,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        border: InputBorder.none,
                        hintText: 'Enter your password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscurePassword ? Iconsax.eye_slash : Iconsax.eye,
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Sizes.spaceBtwItems),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () => Get.to(() => const ForgotPasswordScreen()),
                      child: const Text('forgot password?'),
                    ),
                  ),
                  // SizedBox(height: Sizes.spaceBtwSections),
                  
                  // Terms checkbox
                  // Row(
                  //   children: [
                  //     Checkbox(
                  //       value: agreeToTerms,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           agreeToTerms = value ?? false;
                  //         });
                  //       },
                  //       materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  //     ),
                  //     Expanded(
                  //       child: Text.rich(
                  //         TextSpan(
                  //           children: [
                  //             const TextSpan(
                  //               text: 'I agree with ',
                  //               style: TextStyle(
                  //                 color: Colors.black,
                  //                 fontSize: 14,
                  //                 fontFamily: 'Inter',
                  //                 fontWeight: FontWeight.w300,
                  //               ),
                  //             ),
                  //             TextSpan(
                  //               text: 'terms of use',
                  //               style: TextStyle(
                  //                 color: Colors.black,
                  //                 fontSize: 14,
                  //                 fontFamily: 'Inter',
                  //                 fontWeight: FontWeight.w700,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Get.to(() => const NavigationMenu()),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF19530E), // Background color
                        foregroundColor: Colors.white, // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // Border radius
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16), // Button padding
                      ),
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                    ),
                  ),
                ],
              ),
            ),
            
            // Divider with "or" - moved outside the form padding
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: const Color(0xFFB3BCB2),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'or',
                          style: TextStyle(
                            color: const Color(0xFFB3BCB2),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: const Color(0xFFB3BCB2),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            
            // Social login buttons - moved outside the form padding
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 49,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFB3BCB2),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.android, size: 24),
                          const SizedBox(width: 8),
                          Text(
                            'Google Play',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 49,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFB3BCB2),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.apple, size: 24),
                          const SizedBox(width: 8),
                          Text(
                            'Apple Store',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Login prompt at bottom
            Padding(
              padding: const EdgeInsets.only(top: 32.0, bottom: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegistrationScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign up',  // Fixed typo from "Log up" to "Login"
                      style: TextStyle(
                        color: Color(0xFF249A0F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}