import 'package:flutter/material.dart';

class TTextFieldTheme {
  TTextFieldTheme._();

  static final lightTextFieldTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.grey, width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.blue, width: 2),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.grey, width: 1.5),
    ),
    hintStyle: TextStyle(color: Colors.grey[600]),
  );

  static final darkTextFieldTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.black54,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.grey, width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.blueAccent, width: 2),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.grey, width: 1.5),
    ),
    hintStyle: TextStyle(color: Colors.grey[400]),
  );
}