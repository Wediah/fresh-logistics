import 'package:flutter/material.dart';

class TBottomSheetTheme {
  TBottomSheetTheme._();

  static final lightBottomSheetTheme = BottomSheetThemeData(
    backgroundColor: Colors.white,
    modalBackgroundColor: Colors.white.withOpacity(0.8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    elevation: 8,
  );

  static final darkBottomSheetTheme = BottomSheetThemeData(
    backgroundColor: Colors.black,
    modalBackgroundColor: Colors.black.withOpacity(0.8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    elevation: 8,
  );
}