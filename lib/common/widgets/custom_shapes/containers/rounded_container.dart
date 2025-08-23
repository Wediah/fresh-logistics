import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.showBorder = false,
    this.radius = Sizes.borderRadiusLg,
    this.backgroundColor = AppColors.white,
    this.borderColor = AppColors.borderPrimary,
  });

  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final bool showBorder;
  final double radius;
  final Color backgroundColor;
  final Color borderColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child
    );
  }


}