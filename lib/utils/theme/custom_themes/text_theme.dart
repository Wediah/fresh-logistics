import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle().copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineMedium: TextStyle().copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headlineSmall: TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),

    titleLarge: TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleMedium: TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    titleSmall: TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),

    bodyLarge: TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    bodyMedium: TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    bodySmall: TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),

    labelLarge: TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.black.withValues(alpha: 0.5),
    ),
    labelMedium: TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,  
      color: Colors.black.withValues(alpha: 0.5),
    ),
  );

  // Dark theme text styles
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle().copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineMedium: TextStyle().copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineSmall: TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),

    titleLarge: TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleMedium: TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    titleSmall: TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),

    bodyLarge: TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    bodyMedium: TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    bodySmall: TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),

    labelLarge: TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.white.withValues(alpha: 0.5),
    ),
    labelMedium: TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,  
      color: Colors.white.withValues(alpha: 0.5),
    ),
  );
}