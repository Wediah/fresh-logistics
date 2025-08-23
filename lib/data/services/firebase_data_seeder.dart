import 'package:freshlogistics/data/repositories/product_repository.dart';
import 'package:freshlogistics/features/shop/models/category_model.dart';
import 'package:freshlogistics/features/shop/models/farm_model.dart';
import 'package:freshlogistics/features/shop/models/product_model.dart';
import 'package:freshlogistics/utils/constants/image_strings.dart';

class FirebaseDataSeeder {
  static final ProductRepository _productRepository = ProductRepository.instance;

  /// Call this method once to populate your Firebase database with sample data
  static Future<void> seedDatabase() async {
    try {
      print('🌱 Starting to seed Firebase database...');
      
      // Add farms first
      await _seedFarms();
      
      // Add categories
      await _seedCategories();
      
      // Add products after categories and farms
      await _seedProducts();
      
      print('✅ Database seeding completed successfully!');
    } catch (e) {
      print('❌ Error seeding database: $e');
      rethrow;
    }
  }

  /// Add sample categories to Firebase
  static Future<void> _seedCategories() async {
    print('📂 Adding categories...');

    final categories = [
      Category(
        id: 'vegetables',
        name: 'Vegetables',
        description: 'Fresh organic vegetables',
        imageUrl: 'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=500',
        iconUrl: 'assets/icons/categories/vegetables.png',
        isActive: true,
        sortOrder: 1,
      ),
      Category(
        id: 'fruits',
        name: 'Fruits',
        description: 'Fresh seasonal fruits',
        imageUrl: 'https://images.unsplash.com/photo-1619566636858-adf3ef46400b?w=500',
        iconUrl: 'assets/icons/categories/fruits.png',
        isActive: true,
        sortOrder: 2,
      ),
      Category(
        id: 'dairy',
        name: 'Dairy Products',
        description: 'Fresh milk, cheese, and dairy',
        imageUrl: 'https://images.unsplash.com/photo-1550583724-b2692b85b150?w=500',
        iconUrl: 'assets/icons/categories/dairy.png',
        isActive: true,
        sortOrder: 3,
      ),
      Category(
        id: 'meat',
        name: 'Meat & Poultry',
        description: 'Fresh meat and poultry products',
        imageUrl: 'https://images.unsplash.com/photo-1588347818439-fde54c58e2fc?w=500',
        iconUrl: 'assets/icons/categories/meat.png',
        isActive: true,
        sortOrder: 4,
      ),
      Category(
        id: 'pantry',
        name: 'Pantry Essentials',
        description: 'Rice, grains, and pantry staples',
        imageUrl: 'https://images.unsplash.com/photo-1586201375761-83865001e31c?w=500',
        iconUrl: 'assets/icons/categories/pantry.png',
        isActive: true,
        sortOrder: 5,
      ),
    ];

    for (final category in categories) {
      await _productRepository.addCategory(category);
      print('✓ Added category: ${category.name}');
    }
  }

  /// Add sample products to Firebase
  static Future<void> _seedProducts() async {
    print('🛒 Adding products...');

    final products = [
      // Vegetables
      Product(
        id: '',
        name: 'Fresh Spinach',
        description: 'Organic fresh spinach leaves, perfect for salads and cooking. Rich in iron and vitamins.',
        imageUrl: ImageStrings.product1,
        price: 25.99,
        brand: 'Green Farms',
        category: 'vegetables',
        farmId: 'farm_001', // Green Valley Farm
        availableColors: ['Green'],
        availableSizes: ['100g', '250g', '500g'],
        stockQuantity: 50,
        rating: 4.5,
        reviewCount: 120,
        isInStock: true,
      ),
      Product(
        id: '',
        name: 'Fresh Carrots',
        description: 'Sweet and crunchy organic carrots, perfect for cooking and snacking.',
        imageUrl: 'https://images.unsplash.com/photo-1445282768818-728615cc910a?w=500',
        price: 18.50,
        brand: 'Fresh Valley',
        category: 'vegetables',
        farmId: 'farm_001', // Green Valley Farm
        availableColors: ['Orange'],
        availableSizes: ['500g', '1kg', '2kg'],
        stockQuantity: 75,
        rating: 4.3,
        reviewCount: 89,
        isInStock: true,
      ),
      Product(
        id: '',
        name: 'Bell Peppers',
        description: 'Colorful bell peppers, great for stir-fries and salads.',
        imageUrl: 'https://images.unsplash.com/photo-1563565375-f3fdfdbefa83?w=500',
        price: 45.00,
        brand: 'Rainbow Harvest',
        category: 'vegetables',
        availableColors: ['Red', 'Yellow', 'Green'],
        availableSizes: ['3 pieces', '6 pieces'],
        stockQuantity: 30,
        rating: 4.7,
        reviewCount: 156,
        isInStock: true,
      ),

      // Fruits
      Product(
        id: '',
        name: 'Fresh Apples',
        description: 'Crispy and sweet apples, perfect for snacking or baking.',
        imageUrl: 'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?w=500',
        price: 120.00,
        brand: 'Orchard Fresh',
        category: 'fruits',
        availableColors: ['Red', 'Green'],
        availableSizes: ['1kg', '2kg', '5kg'],
        stockQuantity: 100,
        rating: 4.6,
        reviewCount: 234,
        isInStock: true,
      ),
      Product(
        id: '',
        name: 'Bananas',
        description: 'Ripe yellow bananas, rich in potassium and perfect for smoothies.',
        imageUrl: 'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=500',
        price: 35.00,
        brand: 'Tropical Farms',
        category: 'fruits',
        availableColors: ['Yellow'],
        availableSizes: ['6 pieces', '12 pieces'],
        stockQuantity: 80,
        rating: 4.4,
        reviewCount: 167,
        isInStock: true,
      ),

      // Dairy
      Product(
        id: '',
        name: 'Fresh Milk',
        description: 'Pure fresh milk from grass-fed cows, rich in calcium and protein.',
        imageUrl: 'https://images.unsplash.com/photo-1550583724-b2692b85b150?w=500',
        price: 65.00,
        brand: 'Pure Dairy',
        category: 'dairy',
        availableColors: ['White'],
        availableSizes: ['500ml', '1L', '2L'],
        stockQuantity: 45,
        rating: 4.8,
        reviewCount: 298,
        isInStock: true,
      ),
      Product(
        id: '',
        name: 'Cheddar Cheese',
        description: 'Aged cheddar cheese with rich flavor, perfect for sandwiches and cooking.',
        imageUrl: 'https://images.unsplash.com/photo-1552767059-ce182ead6c1b?w=500',
        price: 180.00,
        brand: 'Artisan Dairy',
        category: 'dairy',
        availableColors: ['Yellow'],
        availableSizes: ['200g', '500g'],
        stockQuantity: 25,
        rating: 4.9,
        reviewCount: 145,
        isInStock: true,
      ),

      // Meat
      Product(
        id: '',
        name: 'Chicken Breast',
        description: 'Fresh boneless chicken breast, perfect for grilling and cooking.',
        imageUrl: 'https://images.unsplash.com/photo-1604503468506-a8da13d82791?w=500',
        price: 250.00,
        brand: 'Farm Fresh Poultry',
        category: 'meat',
        availableColors: ['Pink'],
        availableSizes: ['500g', '1kg'],
        stockQuantity: 35,
        rating: 4.6,
        reviewCount: 189,
        isInStock: true,
      ),

      // Pantry
      Product(
        id: '',
        name: 'Basmati Rice',
        description: 'Premium quality basmati rice with long grains and aromatic flavor.',
        imageUrl: 'https://images.unsplash.com/photo-1586201375761-83865001e31c?w=500',
        price: 450.00,
        brand: 'Royal Grains',
        category: 'pantry',
        availableColors: ['White'],
        availableSizes: ['1kg', '5kg', '10kg'],
        stockQuantity: 60,
        rating: 4.7,
        reviewCount: 312,
        isInStock: true,
      ),
    ];

    for (final product in products) {
      await _productRepository.addProduct(product);
      print('✓ Added product: ${product.name}');
    }
  }

  /// Add sample farms to Firebase
  static Future<void> _seedFarms() async {
    print('🏚️ Adding farms...');

    final farms = [
      Farm(
        id: 'farm_001',
        name: 'Green Valley Farm',
        description: 'Organic vegetables and fruits grown with sustainable farming practices. Family-owned farm since 1985.',
        imageUrl: 'https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=500',
        location: 'Kumasi, Ashanti Region',
        contactInfo: '+233 24 123 4567',
        rating: 4.8,
        reviewCount: 245,
        isVerified: true,
        isActive: true,
      ),
      Farm(
        id: 'farm_002',
        name: 'Sunrise Dairy Farm',
        description: 'Fresh dairy products and farm-raised livestock. Committed to animal welfare and quality.',
        imageUrl: 'https://images.unsplash.com/photo-1500595046743-cd271d694d30?w=500',
        location: 'Sunyani, Bono Region',
        contactInfo: '+233 20 987 6543',
        rating: 4.6,
        reviewCount: 189,
        isVerified: true,
        isActive: true,
      ),
      Farm(
        id: 'farm_003',
        name: 'Golden Harvest Farm',
        description: 'Specializing in grains, legumes, and cereals. Premium quality crops for your pantry needs.',
        imageUrl: 'https://images.unsplash.com/photo-1544197150-b99a580bb7a8?w=500',
        location: 'Tamale, Northern Region',
        contactInfo: '+233 27 456 7890',
        rating: 4.7,
        reviewCount: 156,
        isVerified: true,
        isActive: true,
      ),
      Farm(
        id: 'farm_004',
        name: 'Coastal Fresh Farm',
        description: 'Tropical fruits and vegetables grown near the coast. Known for exceptional citrus fruits.',
        imageUrl: 'https://images.unsplash.com/photo-1472214103451-9374bd1c798e?w=500',
        location: 'Cape Coast, Central Region',
        contactInfo: '+233 24 789 0123',
        rating: 4.5,
        reviewCount: 98,
        isVerified: false,
        isActive: true,
      ),
      Farm(
        id: 'farm_005',
        name: 'Mountain View Organics',
        description: 'High-altitude organic farming with focus on herbs, spices, and specialty vegetables.',
        imageUrl: 'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=500',
        location: 'Bolgatanga, Upper East Region',
        contactInfo: '+233 20 345 6789',
        rating: 4.9,
        reviewCount: 287,
        isVerified: true,
        isActive: true,
      ),
    ];

    for (final farm in farms) {
      await _productRepository.addFarm(farm);
      print('✓ Added farm: ${farm.name}');
    }
  }
}
