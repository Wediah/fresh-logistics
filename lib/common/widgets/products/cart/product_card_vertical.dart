import 'package:flutter/material.dart';
import 'package:freshlogistics/common/widgets/images/rounded_image.dart';
import 'package:freshlogistics/common/widgets/texts/brand_title_text_with_verify_icon.dart';
import 'package:freshlogistics/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../styles/shadows.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../icons/circular_icon.dart';
import '../../texts/brand_title_text.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [ShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(16),
          color: dark ? Colors.grey : Colors.white,
        ),
        child: Column(
          children: [
            RoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(Sizes.p4),
              backgroundColor: dark ? AppColors.dark : AppColors.light,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Center(
                      child: RoundedImage(imageUrl: ImageStrings.product1, applyImageRadius: true),
                    ),
                  ),

                  Positioned(
                    top: 12,
                    child: RoundedContainer(
                      radius: Sizes.p4,
                      backgroundColor: AppColors.secondaryGreen.withValues(alpha: 0.8),
                      padding: const EdgeInsets.symmetric(horizontal: Sizes.p8, vertical: Sizes.p4),
                      child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: AppColors.black)),
                    )
                  ),

                  const Positioned(
                    top: 0,
                    right: 0,
                  child: CircularIcon(icon: Iconsax.heart5, color: Colors.red),
                  ),
                ],
              )
            ),
            const SizedBox(height: Sizes.spaceBtwItems / 2),

            Padding(
              padding: EdgeInsets.only(left: Sizes.p4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(title: 'Sweet Potatoes', smallSize: true,),
                  SizedBox(height: Sizes.spaceBtwItems / 2),
                  BrandTitleWithVerifiedIcon(title: 'His Ways')
                ],
              ),
            ),
            Spacer(),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                      padding: EdgeInsets.only(left: Sizes.p4),
                    child: ProductPriceText(price: '35'),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.dark,
                      borderRadius: BorderRadius.all(Radius.circular(Sizes.p4)),
                    ),
                    child: const SizedBox(
                      width: Sizes.iconLg * 1.2,
                      height: Sizes.iconLg * 1.2,
                      child: Center(child: Icon(Iconsax.add, color: AppColors.white)),
                    ),
                  ),
                ]
            )
          ]
        ),
      )
    );
  }



}