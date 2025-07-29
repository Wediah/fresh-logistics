import 'package:flutter/material.dart';

class TCheckboxTheme {
  TCheckboxTheme._();

  static final lightCheckboxTheme = CheckboxThemeData(
    fillColor: WidgetStateProperty.all(Colors.blue),
    checkColor: WidgetStateProperty.all(Colors.white),
    side: BorderSide(color: Colors.blue, width: 1.5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  );

  static final darkCheckboxTheme = CheckboxThemeData(
    fillColor: WidgetStateProperty.all(Colors.blueAccent),
    checkColor: WidgetStateProperty.all(Colors.white),
    side: BorderSide(color: Colors.blueAccent, width: 1.5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  );
}