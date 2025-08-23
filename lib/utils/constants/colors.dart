import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Main colors (convert hex to Color)
  static const Color primaryGreen = Color(0xFF19530E);
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGrayishGreen = Color(0xFFDCEDD9);
  static const Color secondaryGreen = Color(0xFF249B0F);

  // New additions
  static const Color transparent = Colors
      .transparent; // Flutter provides this constant
  static const Color black = Color(0xFF000000);

  // You can also add semantic colors (e.g., for buttons, text, etc.)
  static const Color buttonColor = primaryGreen;
  static const Color textColor = Color(0xFF333333);
  static const Color errorColor = Color(0xFFE53935);

  static const Color borderPrimary = Color(0xFF090909);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF212121);
  static const Color primaryBackground = Color(0xFFF3F5FF);

}