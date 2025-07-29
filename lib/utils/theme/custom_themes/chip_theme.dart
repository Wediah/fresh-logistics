import 'package:flutter/material.dart';

class TChipTheme {
  TChipTheme._();

  static final lightChipTheme = ChipThemeData(
    backgroundColor: Colors.white,
    selectedColor: Colors.blue,
    secondarySelectedColor: Colors.blueAccent,
    disabledColor: Colors.grey,
    labelStyle: TextStyle(color: Colors.black),
    secondaryLabelStyle: TextStyle(color: Colors.white),
    padding: EdgeInsets.all(8.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
      side: BorderSide(color: Colors.blue, width: 1.5),
    ),
  );

  static final darkChipTheme = ChipThemeData(
    backgroundColor: Colors.black,
    selectedColor: Colors.blueAccent,
    secondarySelectedColor: Colors.lightBlueAccent,
    disabledColor: Colors.grey[800]!,
    labelStyle: TextStyle(color: Colors.white),
    secondaryLabelStyle: TextStyle(color: Colors.black),
    padding: EdgeInsets.all(8.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
      side: BorderSide(color: Colors.blueAccent, width: 1.5),
    ),
  );
}