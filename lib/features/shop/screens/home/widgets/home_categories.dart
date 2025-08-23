import 'package:flutter/material.dart';
import 'package:freshlogistics/features/shop/controllers/product_controller.dart';
import 'package:freshlogistics/features/shop/screens/store/category_products_screen.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/image_text_widget/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class HomeCategory extends StatelessWidget {
  const HomeCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();
    
    return SizedBox(
        height: 80,
        child: Obx(() {
          if (productController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (productController.allCategories.isEmpty) {
            return const Center(child: Text('No categories available'));
          }
          
          return ListView.builder(
            shrinkWrap: true,
            itemCount: productController.allCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = productController.allCategories[index];
              print('🏷️ Rendering category: ${category.name} with image: ${category.imageUrl}');
              return VerticalImageText(
                image: category.imageUrl.isNotEmpty ? category.imageUrl : ImageStrings.fruit,
                title: category.name,
                onTap: () {
                  // Navigate to category products screen
                  Get.to(() => CategoryProductsScreen(category: category));
                },
              );
            },
          );
        })
    );
  }
}