import 'package:flutter/material.dart';
import 'package:freshlogistics/common/widgets/products/cart/product_card_vertical.dart';
import 'package:freshlogistics/features/shop/controllers/product_controller.dart';
import 'package:freshlogistics/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:freshlogistics/features/shop/screens/home/widgets/home_categories.dart';
import 'package:freshlogistics/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/success_screen/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/success_screen/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PrimaryHeaderContainer(
              child: Column(
                children: [
                  FHomeAppBar(),
                  SizedBox(height: Sizes.spaceBtwSections),

                  SearchContainer(text: 'Search for products'),
                  SizedBox(height: Sizes.spaceBtwSections),
                  
                  Padding(
                    padding: EdgeInsets.only(left: Sizes.defaultSpace),
                    child: Column(
                      children: [
                        SectionHeading(title: 'Popular Categories', showActionButton: false, textColor: Colors.white),
                        SizedBox(height: Sizes.spaceBtwItems),
                        HomeCategory()
                      ]
                    ),
                  )
                ],
              ),
            ),

          //   body
            Padding(
              padding: const EdgeInsets.all(Sizes.defaultSpace),
              child: Column(
                children: [
                
                  
                  const PromoSlider(banners: [ImageStrings.banner1, ImageStrings.banner2, ImageStrings.banner3]),
                  const SizedBox(height: Sizes.spaceBtwSections),

                  const SectionHeading(title: 'Popular Products'),
                  const SizedBox(height: Sizes.spaceBtwItems),

                  // Use Firebase products instead of dummy data
                  Obx(() {
                    if (productController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    
                    if (productController.featuredProducts.isEmpty) {
                      return const Center(
                        child: Text('No products available'),
                      );
                    }
                    
                    return GridLayout(
                      itemCount: productController.featuredProducts.length,
                      itemBuilder: (_, index) => ProductCardVertical(
                        product: productController.featuredProducts[index]
                      ),
                    );
                  }),
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}