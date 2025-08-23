import 'package:flutter/material.dart';
import 'package:freshlogistics/common/widgets/images/rounded_image.dart';
import 'package:freshlogistics/common/widgets/texts/brand_title_text_with_verify_icon.dart';
import 'package:freshlogistics/common/widgets/texts/product_price_text.dart';
import 'package:freshlogistics/common/widgets/texts/product_title_text.dart';
import 'package:freshlogistics/features/shop/controllers/cart_controller.dart';
import 'package:freshlogistics/utils/constants/colors.dart';
import 'package:freshlogistics/utils/constants/image_strings.dart';
import 'package:freshlogistics/utils/constants/sizes.dart';
import 'package:get/get.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    
    return Obx(() {
      if (controller.cartItems.isEmpty) {
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey),
              SizedBox(height: 16),
              Text('Your cart is empty', style: TextStyle(fontSize: 18, color: Colors.grey)),
            ],
          ),
        );
      }

      return ListView.separated(
        shrinkWrap: true,
        itemCount: controller.cartItems.length,
        separatorBuilder: (_, __) => const SizedBox(height: Sizes.spaceBtwSections),
        itemBuilder: (_, index) {
          final cartItem = controller.cartItems[index];
          return Column(
            children: [
              // Cart Item
              Row(
                children: [
                  // Image
                  RoundedImage(
                    imageUrl: cartItem.imageUrl.isNotEmpty ? cartItem.imageUrl : ImageStrings.product1,
                    width: 60,
                    height: 60,
                    padding: const EdgeInsets.all(Sizes.p8),
                    backgroundColor: AppColors.lightGrayishGreen,
                    isNetworkImage: cartItem.imageUrl.startsWith('http'),
                  ),
                  const SizedBox(width: Sizes.spaceBtwItems),
                  
                  // Title, Price & Size
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BrandTitleWithVerifiedIcon(title: cartItem.brand),
                        Flexible(child: ProductTitleText(title: cartItem.name, maxLines: 1)),
                        
                        // Attributes
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(text: '${cartItem.color} ', style: Theme.of(context).textTheme.bodyLarge),
                              TextSpan(text: 'Size ', style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(text: cartItem.size, style: Theme.of(context).textTheme.bodyLarge),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              if (showAddRemoveButtons) const SizedBox(height: Sizes.spaceBtwItems),
              if (showAddRemoveButtons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 70),
                        // Quantity controls
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.lightGrayishGreen,
                                borderRadius: BorderRadius.circular(Sizes.borderRadiusMd),
                              ),
                              child: IconButton(
                                onPressed: () => controller.removeOneFromCart(cartItem),
                                icon: const Icon(Icons.remove, size: 18),
                              ),
                            ),
                            const SizedBox(width: Sizes.spaceBtwItems),
                            Obx(() => Text(cartItem.quantity.toString(), style: Theme.of(context).textTheme.titleSmall)),
                            const SizedBox(width: Sizes.spaceBtwItems),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.primaryGreen,
                                borderRadius: BorderRadius.circular(Sizes.borderRadiusMd),
                              ),
                              child: IconButton(
                                onPressed: () => controller.addOneToCart(cartItem),
                                icon: const Icon(Icons.add, color: Colors.white, size: 18),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ProductPriceText(price: (cartItem.price * cartItem.quantity).toStringAsFixed(2)),
                  ],
                ),
            ],
          );
        },
      );
    });
  }
}
