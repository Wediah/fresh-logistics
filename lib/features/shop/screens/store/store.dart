import 'package:flutter/material.dart';
import 'package:freshlogistics/common/widgets/layouts/grid_layout.dart';
import 'package:freshlogistics/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:freshlogistics/common/widgets/products/cart/product_card_vertical.dart';
import 'package:freshlogistics/data/services/firebase_data_seeder.dart';
import 'package:freshlogistics/features/shop/controllers/product_controller.dart';
import 'package:freshlogistics/features/shop/screens/cart/cart.dart';
import 'package:freshlogistics/features/shop/screens/store/category_products_screen.dart';
import 'package:freshlogistics/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/success_screen/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();

    return Scaffold(
      appBar: FAppBar(
        title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          CartCounterIcon(
            onPressed: () => Get.to(() => const CartScreen()),
            iconColor: Colors.black,
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // == SliverAppBar: Only Search Bar ==
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            floating: true,
            backgroundColor: HelperFunctions.isDarkMode(context) ? Colors.black : Colors.white,
            expandedHeight: 100,
            flexibleSpace: Padding(
              padding: const EdgeInsets.all(Sizes.defaultSpace),
              child: SearchContainer(
                text: 'Search in store',
                showBorder: true,
                showBackground: false,
                padding: EdgeInsets.zero,
              ),
            ),
          ),

          // == Scrollable Body ==
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(Sizes.defaultSpace),
              child: Column(
                children: [
                  // --- Shop by Category Section ---
                  Obx(() {
                    if (productController.isLoading.value) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SectionHeading(title: 'Shop by Category'),
                          const SizedBox(height: Sizes.spaceBtwSections),
                          SizedBox(
                            height: 50,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (_, index) => Padding(
                                padding: const EdgeInsets.only(right: Sizes.spaceBtwItems),
                                child: Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.grey[300],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }

                    if (productController.allCategories.isNotEmpty) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SectionHeading(title: 'Shop by Category'),
                          const SizedBox(height: Sizes.spaceBtwItems),
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: productController.allCategories.length,
                              itemBuilder: (_, index) {
                                final category = productController.allCategories[index];
                                return Padding(
                                  padding: const EdgeInsets.only(right: Sizes.spaceBtwItems),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(() => CategoryProductsScreen(category: category));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(color: Colors.blue[300]!, width: 2),
                                        color: Colors.blue[50],
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 3,
                                            offset: const Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(
                                          category.name,
                                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blue[700],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SectionHeading(title: 'Shop by Category'),
                          const SizedBox(height: Sizes.spaceBtwItems),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.orange[50],
                              border: Border.all(color: Colors.orange[300]!),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'No categories available. Please seed the database first.',
                                    style: TextStyle(color: Colors.orange[700]),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: () async {
                                    try {
                                      await FirebaseDataSeeder.seedDatabase();
                                      await productController.refreshData();
                                      Get.snackbar('Success', 'Database seeded successfully!');
                                    } catch (e) {
                                      Get.snackbar('Error', 'Failed to seed database: $e');
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  ),
                                  child: const Text('Seed Data', style: TextStyle(fontSize: 12)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                  }),

                  const SizedBox(height: Sizes.spaceBtwSections),

                  // --- All Products Section ---
                  const SectionHeading(title: 'All Products'),
                  const SizedBox(height: Sizes.spaceBtwItems),

                  Obx(() {
                    if (productController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (productController.allProducts.isEmpty) {
                      return const Center(
                        child: Text('No products available'),
                      );
                    }

                    return GridLayout(
                      itemCount: productController.allProducts.length,
                      itemBuilder: (_, index) => ProductCardVertical(
                        product: productController.allProducts[index],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}