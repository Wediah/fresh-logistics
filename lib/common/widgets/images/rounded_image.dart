import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';


class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = false,
    this.border,
    this.backgroundColor,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = Sizes.borderRadiusLg,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    var dark = HelperFunctions.isDarkMode(context);

    return GestureDetector(
        onTap: onPressed,
        child: Container(
            width: width,
            height: height,
            padding: padding,
            decoration: BoxDecoration(
                border: border,
                color: applyImageRadius ? Colors.transparent : (dark ? Colors.black : backgroundColor),
                borderRadius: BorderRadius.circular(borderRadius)
            ),
            child: ClipRRect(
              borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
              child: Image(
                image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider,
                fit: fit,
              ),
            )
        )
    );
  }
}