import 'package:flutter/material.dart';
import 'package:freshlogistics/common/widgets/appbar/appbar.dart';
import 'package:freshlogistics/common/widgets/layouts/grid_layout.dart';
import 'package:freshlogistics/common/widgets/products/cart/product_card_vertical.dart';
import 'package:freshlogistics/features/shop/controllers/product_controller.dart';
import 'package:freshlogistics/features/shop/models/farm_model.dart';
import 'package:freshlogistics/utils/constants/sizes.dart';
import 'package:get/get.dart';

class FarmProductsScreen extends StatelessWidget {
  const FarmProductsScreen({super.key, required this.farm});

  final Farm farm;

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();
    
    return Scaffold(
      appBar: FAppBar(
        title: Text(farm.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Farm Info
              Container(
                padding: const EdgeInsets.all(Sizes.p16),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(Sizes.borderRadiusLg),
                  border: Border.all(color: Colors.grey[200]!),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Sizes.borderRadiusMd),
                            image: farm.imageUrl.isNotEmpty
                                ? DecorationImage(
                                    image: NetworkImage(farm.imageUrl),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                            color: Colors.grey[300],
                          ),
                          child: farm.imageUrl.isEmpty
                              ? const Icon(Icons.agriculture, color: Colors.grey)
                              : null,
                        ),
                        const SizedBox(width: Sizes.spaceBtwItems),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    farm.name,
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                  if (farm.isVerified) ...[
                                    const SizedBox(width: 8),
                                    const Icon(
                                      Icons.verified,
                                      color: Colors.blue,
                                      size: 20,
                                    ),
                                  ],
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.location_on, size: 16, color: Colors.grey),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      farm.location,
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.amber, size: 16),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${farm.rating} (${farm.reviewCount} reviews)',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (farm.description.isNotEmpty) ...[
                      const SizedBox(height: Sizes.spaceBtwItems),
                      Text(
                        farm.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ],
                ),
              ),
              
              const SizedBox(height: Sizes.spaceBtwSections),
              
              // Products Section
              Text(
                'Products from ${farm.name}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: Sizes.spaceBtwItems),
              
              // Products Grid
              FutureBuilder(
                future: productController.fetchProductsByFarm(farm.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                  
                  final products = snapshot.data ?? [];
                  
                  if (products.isEmpty) {
                    return const Center(
                      child: Column(
                        children: [
                          Icon(Icons.shopping_basket_outlined, size: 64, color: Colors.grey),
                          SizedBox(height: 16),
                          Text(
                            'No Products Available',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text('This farm has no products available at the moment.'),
                        ],
                      ),
                    );
                  }
                  
                  return GridLayout(
                    itemCount: products.length,
                    itemBuilder: (_, index) => ProductCardVertical(
                      product: products[index],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
