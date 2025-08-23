import 'package:flutter/material.dart';
import 'package:freshlogistics/common/widgets/images/rounded_image.dart';
import 'package:freshlogistics/common/widgets/texts/brand_title_text_with_verify_icon.dart';
import 'package:freshlogistics/features/shop/controllers/cart_controller.dart';
import 'package:freshlogistics/features/shop/controllers/favorites_controller.dart';
import 'package:freshlogistics/features/shop/models/product_model.dart';
import 'package:freshlogistics/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/screens/product_details/product_detail.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../styles/shadows.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../icons/circular_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final cartController = CartController.instance;
    final favoritesController = FavoritesController.instance;

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
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
                      child: RoundedImage(imageUrl: product.imageUrl, applyImageRadius: true),
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

                  Positioned(
                    top: 0,
                    right: 0,
                    child: Obx(() => CircularIcon(
                      icon: favoritesController.isFavorite(product.id) ? Iconsax.heart5 : Iconsax.heart,
                      color: favoritesController.isFavorite(product.id) ? Colors.red : null,
                      onPressed: () => favoritesController.toggleFavoriteProduct(product),
                    )),
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
                  ProductTitleText(title: product.name, smallSize: true,),
                  SizedBox(height: Sizes.spaceBtwItems / 2),
                  BrandTitleWithVerifiedIcon(title: product.brand)
                ],
              ),
            ),
            Spacer(),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: Sizes.p4),
                    child: ProductPriceText(price: product.price.toString()),
                  ),
                  GestureDetector(
                    onTap: () => cartController.addToCart(product),
                    child: Container(
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
                  ),
                ]
            )
          ]
        ),
      )
    );
  }



}