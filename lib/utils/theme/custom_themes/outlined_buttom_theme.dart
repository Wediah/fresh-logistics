import 'package:flutter/material.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.blue,
      backgroundColor: Colors.white,
      side: BorderSide(color: Colors.blue),
      elevation: 0,
      textStyle: TextStyle(fontSize: 16),
    ),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.blueAccent,
      backgroundColor: Colors.black,
      side: BorderSide(color: Colors.blueAccent),
      elevation: 0,
      textStyle: TextStyle(fontSize: 16),
    ),
  );
}