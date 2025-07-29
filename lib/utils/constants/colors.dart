import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  // Main colors (convert hex to Color)
  static const Color primaryGreen = Color(0xFF19530E);
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGrayishGreen = Color(0xFFDCEDD9);
  static const Color secondaryGreen = Color(0xFF249B0F);

  // You can also add semantic colors (e.g., for buttons, text, etc.)
  static const Color buttonColor = primaryGreen;
  static const Color textColor = Color(0xFF333333);
  static const Color errorColor = Color(0xFFE53935);
}