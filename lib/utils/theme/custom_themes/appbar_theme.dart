import 'package:flutter/material.dart';

class TAppBarTheme {
  TAppBarTheme._();

  static final lightAppBarTheme = AppBarTheme(
    backgroundColor: Colors.transparent,
    foregroundColor: Colors.transparent, // Text color
    elevation: 0,
    centerTitle: false,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black, size: 24),
    actionsIconTheme: IconThemeData(color: Colors.black, size: 24),
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  static final darkAppBarTheme = AppBarTheme(
    backgroundColor: Colors.transparent,
    foregroundColor: Colors.transparent, // Text color
    elevation: 0,
    centerTitle: false,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.white, size: 24),
    actionsIconTheme: IconThemeData(color: Colors.white, size: 24),
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );
}