import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:freshlogistics/common/widgets/products/cart/product_card_vertical.dart';
import 'package:freshlogistics/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:freshlogistics/features/shop/screens/home/widgets/home_categories.dart';
import 'package:freshlogistics/features/shop/screens/home/widgets/promo_slider.dart';
import '../../../../common/widgets/image_text_widget/vertical_image_text.dart';
import '../../../../common/widgets/images/rounded_image.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/success_screen/custom_shapes/containers/circular_container.dart';
import '../../../../common/widgets/success_screen/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/success_screen/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/home_controller.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  const FHomeAppBar(),
                  const SizedBox(height: Sizes.spaceBtwSections),

                  const SearchContainer(text: 'Search for products'),
                  const SizedBox(height: Sizes.spaceBtwSections),
                  
                  Padding(
                    padding: EdgeInsets.only(left: Sizes.defaultSpace),
                    child: Column(
                      children: [
                        SectionHeading(title: 'Popular Categories', showActionButton: false, textColor: Colors.white),
                        const SizedBox(height: Sizes.spaceBtwItems),
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

                  GridLayout(itemCount: 4, itemBuilder: (_, index) => const ProductCardVertical())
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}