import 'package:flutter/material.dart';
import 'package:freshlogistics/features/shop/controllers/product_controller.dart';
import 'package:freshlogistics/features/shop/screens/store/farm_products_screen.dart';
import 'package:freshlogistics/utils/constants/sizes.dart';
import 'package:get/get.dart';

class HomeFeaturedFarms extends StatelessWidget {
  const HomeFeaturedFarms({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();

    return Obx(() {
      if (productController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (productController.featuredFarms.isEmpty) {
        return const Center(child: Text('No featured farms available'));
      }

      return SizedBox(
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productController.featuredFarms.length,
          itemBuilder: (_, index) {
            final farm = productController.featuredFarms[index];
            print('🏚️ Rendering farm: ${farm.name} with image: ${farm.imageUrl}');

            return Padding(
              padding: const EdgeInsets.only(right: Sizes.spaceBtwItems),
              child: GestureDetector(
                onTap: () {
                  print('🏚️ Navigating to farm: ${farm.name}');
                  Get.to(() => FarmProductsScreen(farm: farm));
                },
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Sizes.borderRadiusLg),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Farm Image
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Sizes.borderRadiusMd),
                          image: farm.imageUrl.isNotEmpty && farm.imageUrl.startsWith('http')
                              ? DecorationImage(
                                  image: NetworkImage(farm.imageUrl),
                                  fit: BoxFit.cover,
                                  onError: (exception, stackTrace) {
                                    print('❌ Error loading farm image: ${farm.imageUrl}');
                                  },
                                )
                              : null,
                          color: Colors.grey[300],
                        ),
                        child: farm.imageUrl.isEmpty || !farm.imageUrl.startsWith('http')
                            ? const Icon(
                                Icons.agriculture,
                                color: Colors.grey,
                                size: 30,
                              )
                            : null,
                      ),
                      
                      const SizedBox(height: Sizes.spaceBtwItems / 2),
                      
                      // Farm Name
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            Text(
                              farm.name,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (farm.isVerified)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.verified,
                                    color: Colors.blue,
                                    size: 12,
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    'Verified',
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.blue,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
