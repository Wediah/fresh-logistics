import 'package:flutter/material.dart';
import 'package:freshlogistics/common/widgets/appbar/appbar.dart';
import 'package:freshlogistics/common/widgets/icons/circular_icon.dart';
import 'package:freshlogistics/common/widgets/layouts/grid_layout.dart';
import 'package:freshlogistics/common/widgets/products/cart/product_card_vertical.dart';
import 'package:freshlogistics/features/shop/controllers/favorites_controller.dart';
import 'package:freshlogistics/features/shop/controllers/product_controller.dart';
import 'package:freshlogistics/utils/constants/sizes.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesController = Get.find<FavoritesController>();
    final productController = Get.find<ProductController>();
    
    return Scaffold(
      appBar: FAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          CircularIcon(
            icon: Icons.clear_all,
            onPressed: () => favoritesController.clearFavorites(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              Obx(() {
                final favoriteProducts = favoritesController.getFavoriteProducts(productController.allProducts);
                
                if (productController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                
                if (favoriteProducts.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite_border, size: 64, color: Colors.grey),
                        SizedBox(height: 16),
                        Text(
                          'No Favorites Yet',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text('Add products to your favorites to see them here'),
                      ],
                    ),
                  );
                }
                
                return GridLayout(
                  itemCount: favoriteProducts.length,
                  itemBuilder: (_, index) => ProductCardVertical(
                    product: favoriteProducts[index]
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
