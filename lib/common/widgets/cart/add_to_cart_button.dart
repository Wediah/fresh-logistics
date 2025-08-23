import 'package:flutter/material.dart';
import 'package:freshlogistics/features/shop/controllers/cart_controller.dart';
import 'package:freshlogistics/features/shop/models/product_model.dart';
import 'package:freshlogistics/utils/constants/colors.dart';
import 'package:freshlogistics/utils/constants/sizes.dart';
import 'package:get/get.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.product,
    this.selectedColor,
    this.selectedSize,
  });

  final Product product;
  final String? selectedColor;
  final String? selectedSize;

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    
    return Obx(() {
      final isInCart = cartController.cartItems
          .any((item) => item.productId == product.id);
          
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: product.isInStock 
              ? () => cartController.addToCart(
                    product,
                    selectedColor: selectedColor,
                    selectedSize: selectedSize,
                  )
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: isInCart 
                ? AppColors.secondaryGreen 
                : AppColors.primaryGreen,
            foregroundColor: AppColors.white,
            padding: const EdgeInsets.symmetric(vertical: Sizes.p16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.borderRadiusMd),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isInCart ? Icons.check : Icons.shopping_cart_outlined,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                isInCart ? 'Added to Cart' : 'Add to Cart',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class QuickAddToCartButton extends StatelessWidget {
  const QuickAddToCartButton({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryGreen,
        borderRadius: BorderRadius.circular(Sizes.borderRadiusMd),
      ),
      child: IconButton(
        onPressed: product.isInStock 
            ? () => cartController.addToCart(product)
            : null,
        icon: const Icon(
          Icons.add_shopping_cart,
          color: AppColors.white,
          size: 18,
        ),
      ),
    );
  }
}
