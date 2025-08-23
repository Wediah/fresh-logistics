import 'package:flutter/material.dart';
import 'package:freshlogistics/common/widgets/appbar/appbar.dart';
import 'package:freshlogistics/common/widgets/layouts/grid_layout.dart';
import 'package:freshlogistics/common/widgets/products/cart/product_card_vertical.dart';
import 'package:freshlogistics/common/widgets/texts/section_heading.dart';
import 'package:freshlogistics/utils/constants/sizes.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FAppBar(
        title: Text('Search Results'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for products...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Sizes.borderRadiusLg),
                  ),
                ),
              ),
              const SizedBox(height: Sizes.spaceBtwSections),

              // Results section
              const SectionHeading(title: 'Search Results (24)', showActionButton: false),
              const SizedBox(height: Sizes.spaceBtwItems),

              // Products Grid
              GridLayout(
                itemCount: 8,
                itemBuilder: (_, index) => const ProductCardVertical(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
