import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HelperFunctions {
  // ---------------------------
  // 1. Text & String Helpers
  // ---------------------------

  /// Checks if a string is empty or null
  static bool isNullOrEmpty(String? text) => text == null || text.trim().isEmpty;

  /// Generates a random string (useful for IDs, temp filenames)
  static String generateRandomString({int length = 10}) {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(random.nextInt(chars.length)),
      ),
    );
  }

  // ---------------------------
  // 2. Navigation Helpers
  // ---------------------------

  /// Pushes to a new screen
  static void navigateTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// Replaces current screen
  static void replaceScreen(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  // ---------------------------
  // 3. Context Helpers
  // ---------------------------

  /// Gets screen size from context
  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  /// Checks if device is in dark mode
  static bool isDarkMode(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }

  // ---------------------------
  // 4. Validation Helpers
  // ---------------------------

  /// Validates email format
  static bool isValidEmail(String email) {
    return RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
    ).hasMatch(email);
  }

  /// Validates password (min 6 chars, at least 1 number & letter)
  static bool isValidPassword(String password) {
    return password.length >= 6 &&
           RegExp(r'[0-9]').hasMatch(password) &&
           RegExp(r'[a-zA-Z]').hasMatch(password);
  }

  // ---------------------------
  // 5. File & Size Helpers
  // ---------------------------

  /// Formats file size (e.g., 1.5 MB)
  static String formatFileSize(int bytes) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB"];
    final i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(1)} ${suffixes[i]}';
  }

  // ---------------------------
  // 6. Miscellaneous Helpers
  // ---------------------------

  /// Delays execution (useful for animations, API mocking)
  static Future<void> delay({int milliseconds = 500}) async {
    await Future.delayed(Duration(milliseconds: milliseconds));
  }

  /// Copies text to clipboard
  static Future<void> copyToClipboard(String text, {BuildContext? context}) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Copied to clipboard')),
      );
    }
  }

  
}