import 'package:flutter/material.dart';

class ShadowStyle {

  static final verticalProductShadow = BoxShadow(
    color: Colors.grey.withValues(alpha: 0.1),
    spreadRadius: 7,
    blurRadius: 50,
    offset: const Offset(0, 2),
  );

  static final horizontalProductShadow = BoxShadow(
    color: Colors.grey.withValues(alpha: 0.1),
    spreadRadius: 7,
    blurRadius: 50,
    offset: const Offset(0, 2),
  );
}