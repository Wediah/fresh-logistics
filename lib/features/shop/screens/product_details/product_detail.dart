import 'package:flutter/material.dart';
import 'package:freshlogistics/common/widgets/appbar/appbar.dart';
import 'package:freshlogistics/common/widgets/icons/circular_icon.dart';
import 'package:freshlogistics/common/widgets/images/rounded_image.dart';
import 'package:freshlogistics/common/widgets/texts/product_price_text.dart';
import 'package:freshlogistics/common/widgets/texts/product_title_text.dart';
import 'package:freshlogistics/common/widgets/texts/section_heading.dart';
import 'package:freshlogistics/utils/constants/colors.dart';
import 'package:freshlogistics/utils/constants/image_strings.dart';
import 'package:freshlogistics/utils/constants/sizes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FAppBar(showBackArrow: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product Image
            Container(
              width: double.infinity,
              height: 400,
              padding: const EdgeInsets.all(Sizes.defaultSpace),
              child: const Center(
                child: RoundedImage(
                  imageUrl: ImageStrings.product1,
                  applyImageRadius: true,
                ),
              ),
            ),
            
            // Product Details
            Padding(
              padding: const EdgeInsets.only(
                right: Sizes.defaultSpace,
                left: Sizes.defaultSpace,
                bottom: Sizes.defaultSpace,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Rating & Share
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 24),
                          const SizedBox(width: Sizes.spaceBtwItems / 2),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: '5.0', style: Theme.of(context).textTheme.bodyLarge),
                                const TextSpan(text: '(199)'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.share, size: Sizes.iconMd)),
                    ],
                  ),
                  
                  // Price & Title
                  const SizedBox(height: Sizes.spaceBtwItems),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: Sizes.p8, vertical: Sizes.p4),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryGreen.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(Sizes.borderRadiusSm),
                        ),
                        child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: AppColors.white)),
                      ),
                      const SizedBox(width: Sizes.spaceBtwItems),
                      Text('\$250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
                      const SizedBox(width: Sizes.spaceBtwItems),
                      const ProductPriceText(price: '175', isLarge: true),
                    ],
                  ),
                  
                  const SizedBox(height: Sizes.spaceBtwItems / 1.5),
                  const ProductTitleText(title: 'Green Spinach'),
                  const SizedBox(height: Sizes.spaceBtwItems / 1.5),
                  
                  // Stock Status
                  Row(
                    children: [
                      const ProductTitleText(title: 'Status'),
                      const SizedBox(width: Sizes.spaceBtwItems),
                      Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                  
                  // Brand
                  const SizedBox(height: Sizes.spaceBtwItems / 1.5),
                  Row(
                    children: [
                      CircularIcon(
                        icon: Icons.verified,
                        color: AppColors.primaryGreen,
                        width: 32,
                        height: 32,
                        size: 16,
                      ),
                      const SizedBox(width: Sizes.spaceBtwItems / 2),
                      Flexible(child: Text('Green', style: Theme.of(context).textTheme.titleMedium, overflow: TextOverflow.ellipsis)),
                    ],
                  ),
                  
                  // Checkout Button
                  const SizedBox(height: Sizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () {}, child: const Text('Add to Cart')),
                  ),
                  const SizedBox(height: Sizes.spaceBtwSections),
                  
                  // Description
                  const SectionHeading(title: 'Description', showActionButton: false),
                  const SizedBox(height: Sizes.spaceBtwItems),
                  const Text(
                    'This is a product description for Green Spinach. There are more things that can be added but I am just demonstrating and nothing else. Fresh and organic spinach grown locally.',
                  ),
                  
                  // Reviews
                  const SizedBox(height: Sizes.spaceBtwSections),
                  const Divider(),
                  const SizedBox(height: Sizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SectionHeading(title: 'Reviews(199)', showActionButton: false),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios, size: 18)),
                    ],
                  ),
                  const SizedBox(height: Sizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.defaultSpace, vertical: Sizes.spaceBtwItems),
        decoration: const BoxDecoration(
          color: AppColors.lightGrayishGreen,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Sizes.cardRadiusLg),
            topRight: Radius.circular(Sizes.cardRadiusLg),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircularIcon(
                  icon: Icons.remove,
                  backgroundColor: AppColors.lightGrayishGreen,
                  width: 40,
                  height: 40,
                  color: AppColors.white,
                ),
                const SizedBox(width: Sizes.spaceBtwItems),
                Text('2', style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: Sizes.spaceBtwItems),
                CircularIcon(
                  icon: Icons.add,
                  backgroundColor: AppColors.primaryGreen,
                  width: 40,
                  height: 40,
                  color: AppColors.white,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(Sizes.spaceBtwItems),
                backgroundColor: AppColors.primaryGreen,
                side: const BorderSide(color: AppColors.primaryGreen),
              ),
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
