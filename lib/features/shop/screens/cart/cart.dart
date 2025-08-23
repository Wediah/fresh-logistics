import 'package:flutter/material.dart';
import 'package:freshlogistics/common/widgets/appbar/appbar.dart';
import 'package:freshlogistics/features/shop/controllers/cart_controller.dart';
import 'package:freshlogistics/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:freshlogistics/features/shop/screens/checkout/checkout.dart';
import 'package:freshlogistics/utils/constants/sizes.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    
    return Scaffold(
      appBar: FAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
        actions: [
          IconButton(
            onPressed: () => controller.clearCart(),
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(Sizes.defaultSpace),
        child: CartItems(),
      ),
      bottomNavigationBar: Obx(() => controller.cartItems.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(Sizes.defaultSpace),
              child: ElevatedButton(
                onPressed: () => Get.to(() => const CheckoutScreen()),
                child: Obx(() => Text('Checkout ${controller.totalCartPriceFormatted}')),
              ),
            )
          : const SizedBox()),
    );
  }
}
