import 'package:flutter/material.dart';
import 'package:freshlogistics/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:freshlogistics/common/widgets/layouts/grid_layout.dart';
import 'package:freshlogistics/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:freshlogistics/common/widgets/texts/brand_title_text_with_verify_icon.dart';
import 'package:freshlogistics/features/shop/screens/product_list/product_list.dart';
import 'package:freshlogistics/utils/constants/image_strings.dart';
import 'package:freshlogistics/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/brand/brand_card.dart';
import '../../../../common/widgets/images/circular_image.dart';
import '../../../../common/widgets/success_screen/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
       child: Scaffold(
        appBar: FAppBar(
            title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
            actions: [
              CartCounterIcon(
                  onPressed: (){}, iconColor: Colors.black,
              )
            ],
        ),

        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: HelperFunctions.isDarkMode(context) ? Colors.black : Colors.white,
                  expandedHeight: 440,

                  flexibleSpace: Padding(
                    padding: EdgeInsets.all(Sizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        SizedBox(height: Sizes.spaceBtwItems),
                        SearchContainer(text: 'Search in store', showBorder: true, showBackground: false, padding: EdgeInsets.zero),
                        SizedBox(height: Sizes.spaceBtwSections),

                        SectionHeading(title: 'Featured Farms', onPressed: (){}),
                        const SizedBox(height: Sizes.spaceBtwItems / 1.5),

                        GridLayout(
                            itemCount: 4,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                          return BrandCard(showBorder: true);
                        }),
                      ]
                    ),
                  ),

                  bottom: const FTabBar(
                    tabs: [
                      Tab(text: 'Fruit Vegetables'),
                      Tab(text: 'Flower Vegetables'),
                      Tab(text: 'Bulb Vegetables'),
                      Tab(text: 'Leafy Vegetables'),
                      Tab(text: 'Root Vegetables'),
                      Tab(text: 'Seed Vegetables'),
                      Tab(text: 'Stem Vegetables'),
                    ],
                  )
                )
              ];
            },
            body: TabBarView(
              children: [
                // Fruit Vegetables
                Padding(
                    padding: const EdgeInsets.all(Sizes.defaultSpace),
                  child: Column(
                    children: [
                      RoundedContainer(
                        showBorder: true,
                        borderColor: Colors.grey,
                        backgroundColor: Colors.transparent,
                        margin: const EdgeInsets.only(bottom: Sizes.spaceBtwItems),
                        child: Column(
                          children: [
                            const BrandCard(showBorder: true),

                            Row(
                              children: [
                                RoundedContainer(
                                  height: 100,
                                  backgroundColor: HelperFunctions.isDarkMode(context) ? Colors.black : Colors.white,
                                  margin: const EdgeInsets.only(right: Sizes.p2),
                                  child: Image(image: AssetImage(ImageStrings.product1)),
                                )
                              ]
                            )
                          ]
                        ),
                      )
                    ]
                  )
                ),
                
                // Flower Vegetables
                Padding(
                  padding: const EdgeInsets.all(Sizes.defaultSpace),
                  child: Center(child: Text('Flower Vegetables', style: Theme.of(context).textTheme.headlineMedium)),
                ),
                
                // Bulb Vegetables
                Padding(
                  padding: const EdgeInsets.all(Sizes.defaultSpace),
                  child: Center(child: Text('Bulb Vegetables', style: Theme.of(context).textTheme.headlineMedium)),
                ),
                
                // Leafy Vegetables
                Padding(
                  padding: const EdgeInsets.all(Sizes.defaultSpace),
                  child: Center(child: Text('Leafy Vegetables', style: Theme.of(context).textTheme.headlineMedium)),
                ),
                
                // Root Vegetables
                Padding(
                  padding: const EdgeInsets.all(Sizes.defaultSpace),
                  child: Center(child: Text('Root Vegetables', style: Theme.of(context).textTheme.headlineMedium)),
                ),
                
                // Seed Vegetables
                Padding(
                  padding: const EdgeInsets.all(Sizes.defaultSpace),
                  child: Center(child: Text('Seed Vegetables', style: Theme.of(context).textTheme.headlineMedium)),
                ),
                
                // Stem Vegetables
                Padding(
                  padding: const EdgeInsets.all(Sizes.defaultSpace),
                  child: Center(child: Text('Stem Vegetables', style: Theme.of(context).textTheme.headlineMedium)),
                ),
              ]
            )
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Get.to(() => const ProductListScreen()),
          backgroundColor: AppColors.primaryGreen,
          foregroundColor: Colors.white,
          icon: const Icon(Icons.shopping_cart),
          label: const Text('Cart Demo'),
        ),
        ),
    );
  }
}