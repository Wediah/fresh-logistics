import 'package:flutter/material.dart';
import 'package:freshlogistics/features/shop/controllers/cart_controller.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';


class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({
    super.key,
    required this.onPressed,
    required this.iconColor,
  });

  final VoidCallback onPressed;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    
    return Stack(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(Iconsax.shopping_bag, color: iconColor),
          ),
          Positioned(
              right: 0,
              child: Obx(() {
                final itemCount = cartController.noOfCartItems.value;
                // Only show counter if there are items in cart
                if (itemCount == 0) return const SizedBox.shrink();
                
                return Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: AppColors.black.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        itemCount > 99 ? '99+' : itemCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                );
              })
          )
        ]
    );
  }
}