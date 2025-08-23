import 'package:flutter/material.dart';
import 'package:freshlogistics/common/widgets/appbar/appbar.dart';
import 'package:freshlogistics/common/widgets/layouts/grid_layout.dart';
import 'package:freshlogistics/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:freshlogistics/common/widgets/products/cart/product_card_vertical.dart';
import 'package:freshlogistics/features/shop/controllers/product_controller.dart';
import 'package:freshlogistics/features/shop/models/category_model.dart';
import 'package:freshlogistics/features/shop/screens/cart/cart.dart';
import 'package:freshlogistics/utils/constants/sizes.dart';
import 'package:get/get.dart';

class CategoryProductsScreen extends StatelessWidget {
  final Category category;
  
  const CategoryProductsScreen({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();
    
    return Scaffold(
      appBar: FAppBar(
        title: Text(category.name, style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
        actions: [
          CartCounterIcon(
            onPressed: () => Get.to(() => const CartScreen()),
            iconColor: Colors.black,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category Description
              if (category.description.isNotEmpty) ...[
                Text(
                  category.description,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: Sizes.spaceBtwSections),
              ],
              
              // Products Grid
              Obx(() {
                // Get products by category using the controller method
                final categoryProducts = productController.getProductsByCategory(category.id);
                
                if (productController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                
                if (categoryProducts.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_basket_outlined,
                          size: 64,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No Products Found',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'No products available in ${category.name} category',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[600],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }
                
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${categoryProducts.length} Products Found',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: Sizes.spaceBtwItems),
                    GridLayout(
                      itemCount: categoryProducts.length,
                      itemBuilder: (_, index) => ProductCardVertical(
                        product: categoryProducts[index]
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
