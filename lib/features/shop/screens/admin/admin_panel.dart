import 'package:flutter/material.dart';
import 'package:freshlogistics/data/services/firebase_data_seeder.dart';
import 'package:freshlogistics/features/shop/controllers/product_controller.dart';
import 'package:freshlogistics/utils/constants/sizes.dart';
import 'package:freshlogistics/utils/popups/loaders.dart';
import 'package:get/get.dart';

class AdminPanel extends StatelessWidget {
  const AdminPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Firebase Database Management',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: Sizes.spaceBtwSections),

            // Seed Database Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _seedDatabase(context),
                icon: const Icon(Icons.cloud_upload),
                label: const Text('Seed Database with Sample Data'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16),
                ),
              ),
            ),
            const SizedBox(height: Sizes.spaceBtwItems),

            // Refresh Data Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _refreshData(context),
                icon: const Icon(Icons.refresh),
                label: const Text('Refresh App Data'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16),
                ),
              ),
            ),
            const SizedBox(height: Sizes.spaceBtwSections),

            // Current Data Status
            Text(
              'Current Data Status:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: Sizes.spaceBtwItems),

            Obx(() => Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('📦 Total Products: ${productController.allProducts.length}'),
                    const SizedBox(height: 8),
                    Text('⭐ Featured Products: ${productController.featuredProducts.length}'),
                    const SizedBox(height: 8),
                    Text('📁 Categories: ${productController.allCategories.length}'),
                    const SizedBox(height: 8),
                    Text('🔄 Loading: ${productController.isLoading.value ? "Yes" : "No"}'),
                  ],
                ),
              ),
            )),

            const SizedBox(height: Sizes.spaceBtwSections),

            // Instructions
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '📋 Instructions:',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('1. Tap "Seed Database" to add sample products and categories to Firebase'),
                  const Text('2. Tap "Refresh App Data" to reload data from Firebase'),
                  const Text('3. Go back to the app to see the products loaded from Firebase'),
                  const SizedBox(height: 8),
                  const Text(
                    '⚠️ Note: Seeding will add new data to your Firebase. Make sure your Firestore rules allow writes.',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _seedDatabase(BuildContext context) async {
    try {
      TLoaders.customToast(message: 'Starting database seeding...');
      
      await FirebaseDataSeeder.seedDatabase();
      
      TLoaders.successSnackBar(
        title: 'Success!',
        message: 'Database has been seeded with sample data',
      );

      // Refresh the data after seeding
      await _refreshData(context);
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'Error!',
        message: 'Failed to seed database: $e',
      );
    }
  }

  Future<void> _refreshData(BuildContext context) async {
    try {
      final productController = Get.find<ProductController>();
      
      TLoaders.customToast(message: 'Refreshing data...');
      
      await productController.refreshData();
      
      TLoaders.successSnackBar(
        title: 'Success!',
        message: 'Data refreshed from Firebase',
      );
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'Error!',
        message: 'Failed to refresh data: $e',
      );
    }
  }
}
