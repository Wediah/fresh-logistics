import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';


class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = AppColors.white,
    this.backgroundColor = Colors.white,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return GestureDetector(
        onTap: onTap,
        child: Padding(
            padding: const EdgeInsets.only(right: Sizes.spaceBtwItems),
            child: Column(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  padding: const EdgeInsets.all(Sizes.p8),
                  decoration: BoxDecoration(
                    color: backgroundColor ?? (dark ? Colors.black : Colors.white),
                    borderRadius: BorderRadius.circular(Sizes.borderRadiusCircle),
                  ),
                  child: ClipOval(
                    child: Image(
                      image: (image.startsWith('http://') || image.startsWith('https://')) 
                          ? NetworkImage(image) 
                          : AssetImage(image) as ImageProvider,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: const Icon(
                            Icons.category,
                            color: Colors.grey,
                            size: 30,
                          ),
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: Sizes.spaceBtwItems / 2),
                SizedBox(
                  width: 50,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            )
        )
    );
  }
}