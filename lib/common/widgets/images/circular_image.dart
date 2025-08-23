import 'package:flutter/material.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.fit = BoxFit.cover,
    this.width = 56,
    this.height = 56,
    this.padding = Sizes.p4,
    required this.image,
    this.isNetworkImage = false,
    this.backgroundColor,
    this.overlayColor,
  });

  final BoxFit? fit;
  final double width, height, padding;
  final String image;
  final bool isNetworkImage;
  final Color? backgroundColor;
  final Color? overlayColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (HelperFunctions.isDarkMode(context) ? Colors.black : Colors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image(
        fit: fit,
        image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
        color: overlayColor,
      ),
    );
  }
}