import 'package:flutter/material.dart';
import 'package:freshlogistics/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:freshlogistics/features/shop/controllers/product_controller.dart';
import 'package:freshlogistics/features/shop/screens/store/farm_products_screen.dart';
import 'package:get/get.dart';

class FeaturedFarms extends StatelessWidget {
  const FeaturedFarms({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();
    
    return SizedBox(
      height: 80,
      child: Obx(() {
        if (productController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        
        if (productController.featuredFarms.isEmpty) {
          return const Center(child: Text('No featured farms available'));
        }
        
        return ListView.builder(
          shrinkWrap: true,
          itemCount: productController.featuredFarms.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final farm = productController.featuredFarms[index];
            print('🚜 Rendering farm: ${farm.name} with image: ${farm.imageUrl}');
            
            return VerticalImageText(
              image: farm.imageUrl.isNotEmpty ? farm.imageUrl : 'assets/icons/categories/fruit.png',
              title: farm.name,
              onTap: () {
                print('🚜 Tapping on farm: ${farm.name}');
                // Navigate to farm products screen
                Get.to(() => FarmProductsScreen(farm: farm));
              },
            );
          },
        );
      }),
    );
  }
}
