import 'package:flutter/material.dart';
import 'package:freshlogistics/common/widgets/appbar/appbar.dart';
import 'package:freshlogistics/common/widgets/cart/add_to_cart_button.dart';
import 'package:freshlogistics/common/widgets/images/rounded_image.dart';
import 'package:freshlogistics/data/services/product_service.dart';
import 'package:freshlogistics/features/shop/controllers/cart_controller.dart';
import 'package:freshlogistics/features/shop/screens/cart/cart.dart';
import 'package:freshlogistics/utils/constants/colors.dart';
import 'package:freshlogistics/utils/constants/sizes.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    final products = ProductService.getSampleProducts();

    return Scaffold(
      appBar: FAppBar(
        title: const Text('Products'),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () => Get.to(() => const CartScreen()),
                icon: const Icon(Icons.shopping_cart_outlined),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Obx(() => cartController.noOfCartItems.value > 0
                    ? Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: AppColors.primaryGreen,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${cartController.noOfCartItems.value}',
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : const SizedBox()),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.only(bottom: Sizes.spaceBtwItems),
            child: Padding(
              padding: const EdgeInsets.all(Sizes.p16),
              child: Row(
                children: [
                  // Product Image
                  RoundedImage(
                    imageUrl: product.imageUrl,
                    width: 80,
                    height: 80,
                    padding: const EdgeInsets.all(Sizes.p8),
                    backgroundColor: AppColors.lightGrayishGreen,
                  ),
                  const SizedBox(width: Sizes.spaceBtwItems),
                  
                  // Product Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          product.brand,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.secondaryGreen,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          product.description,
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${product.price.toStringAsFixed(2)}',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: AppColors.primaryGreen,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            QuickAddToCartButton(product: product),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: Obx(() => cartController.cartItems.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () => Get.to(() => const CartScreen()),
              backgroundColor: AppColors.primaryGreen,
              icon: const Icon(Icons.shopping_cart, color: AppColors.white),
              label: Text(
                'View Cart (${cartController.noOfCartItems.value})',
                style: const TextStyle(color: AppColors.white),
              ),
            )
          : const SizedBox()),
    );
  }
}
