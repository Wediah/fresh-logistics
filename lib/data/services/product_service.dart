import 'package:freshlogistics/features/shop/models/product_model.dart';
import 'package:freshlogistics/utils/constants/image_strings.dart';

class ProductService {
  // Sample products for demonstration
  static List<Product> getSampleProducts() {
    return [
      Product(
        id: '1',
        name: 'Green Spinach',
        description: 'Fresh organic green spinach leaves, perfect for salads and cooking.',
        imageUrl: ImageStrings.product1,
        price: 25.99,
        brand: 'Fresh Greens',
        category: 'Vegetables',
        availableColors: ['Green', 'Dark Green'],
        availableSizes: ['Small (100g)', 'Medium (250g)', 'Large (500g)'],
        stockQuantity: 50,
        rating: 4.5,
        reviewCount: 120,
        isInStock: true,
      ),
      Product(
        id: '2',
        name: 'Fresh Carrots',
        description: 'Sweet and crunchy organic carrots, rich in vitamins.',
        imageUrl: ImageStrings.product1, // Using same image for demo
        price: 18.50,
        brand: 'Farm Fresh',
        category: 'Vegetables',
        availableColors: ['Orange', 'Purple'],
        availableSizes: ['Small (200g)', 'Medium (500g)', 'Large (1kg)'],
        stockQuantity: 30,
        rating: 4.7,
        reviewCount: 85,
        isInStock: true,
      ),
      Product(
        id: '3',
        name: 'Red Tomatoes',
        description: 'Juicy red tomatoes, perfect for cooking and salads.',
        imageUrl: ImageStrings.product1, // Using same image for demo
        price: 22.00,
        brand: 'Garden Fresh',
        category: 'Vegetables',
        availableColors: ['Red', 'Cherry Red'],
        availableSizes: ['Small (250g)', 'Medium (500g)', 'Large (1kg)'],
        stockQuantity: 45,
        rating: 4.3,
        reviewCount: 95,
        isInStock: true,
      ),
    ];
  }

  // Get product by ID
  static Product? getProductById(String id) {
    try {
      return getSampleProducts().firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }

  // Search products by name
  static List<Product> searchProducts(String query) {
    return getSampleProducts()
        .where((product) => 
            product.name.toLowerCase().contains(query.toLowerCase()) ||
            product.category.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  // Get products by category
  static List<Product> getProductsByCategory(String category) {
    return getSampleProducts()
        .where((product) => product.category.toLowerCase() == category.toLowerCase())
        .toList();
  }
}
