import 'package:flutter/material.dart';
import '../../../../utils/constants/sizes.dart';

class SpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: Sizes.appBarHeight, // Default app bar height
    left: Sizes.defaultSpace, // Default left padding
    right: Sizes.defaultSpace, // Default right padding
    bottom: Sizes.defaultSpace, // Default bottom padding
  );
}