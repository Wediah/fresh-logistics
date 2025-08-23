import 'package:flutter/material.dart';
import 'package:freshlogistics/features/shop/screens/search/search.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.padding = const EdgeInsets.symmetric(horizontal: Sizes.defaultSpace),
    this.onTap,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Padding(
        padding: padding,
        child: GestureDetector(
          onTap: onTap ?? () {
            print('🔍 SearchContainer tapped, navigating to SearchScreen');
            Get.to(() => const SearchScreen());
          },
          child: Container(
              width: DeviceUtility.getScreenWidth(context),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: showBackground ? dark ? Colors.black : Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(Sizes.borderRadiusXl),
                border: showBorder ? Border.all(color: Colors.grey, width: 1) : null,
              ),
              child: Row(
                  children: [
                    Icon(icon, color: Colors.grey),
                    const SizedBox(width: Sizes.spaceBtwItems),
                    Text(text, style: Theme.of(context).textTheme.bodySmall!.apply(color: Colors.grey)),
                  ]
              )
          ),
        )
    );
  }
}