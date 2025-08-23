import 'package:freshlogistics/data/repositories/product_repository.dart';
import 'package:freshlogistics/features/shop/models/category_model.dart';
import 'package:freshlogistics/features/shop/models/product_model.dart';
import 'package:freshlogistics/utils/popups/loaders.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final ProductRepository _productRepository = Get.put(ProductRepository());

  // Observable variables
  RxList<Product> allProducts = <Product>[].obs;
  RxList<Product> featuredProducts = <Product>[].obs;
  RxList<Category> allCategories = <Category>[].obs;
  RxBool isLoading = false.obs;
  RxString selectedCategory = ''.obs;

  @override
  void onInit() {
    fetchAllProducts();
    fetchFeaturedProducts();
    fetchAllCategories();
    super.onInit();
  }

  // =========================== PRODUCTS ===========================

  /// Fetch featured products
  Future<void> fetchFeaturedProducts() async {
    try {
      isLoading.value = true;

      // Fetch featured products from Firebase
      final products = await _productRepository.getFeaturedProducts();
      
      // If no featured products, get first 10 products
      if (products.isEmpty) {
        final allProductsList = await _productRepository.getAllProducts();
        featuredProducts.assignAll(allProductsList.take(10).toList());
      } else {
        featuredProducts.assignAll(products);
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Fetch all products
  Future<void> fetchAllProducts() async {
    try {
      isLoading.value = true;
      print('🛒 Fetching all products...');
      final products = await _productRepository.getAllProducts();
      print('🛒 Fetched ${products.length} products');
      allProducts.assignAll(products);
      
      // Debug: Print product details
      for (var product in products.take(3)) {
        print('✓ Product: ${product.name} - ${product.imageUrl}');
      }
    } catch (e) {
      print('❌ Error fetching products: $e');
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Fetch products by category
  Future<List<Product>> fetchProductsByCategory(String categoryId) async {
    try {
      return await _productRepository.getProductsByCategory(categoryId);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// Get products by category ID
  List<Product> getProductsByCategory(String categoryId) {
    return allProducts.where((product) => 
        product.category.toLowerCase() == categoryId.toLowerCase()
    ).toList();
  }

  /// Search products
  Future<List<Product>> searchProducts(String searchTerm) async {
    try {
      if (searchTerm.isEmpty) return allProducts;
      return await _productRepository.searchProducts(searchTerm);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  // =========================== CATEGORIES ===========================

  /// Fetch all categories
  Future<void> fetchAllCategories() async {
    try {
      print('🏷️ Fetching categories...');
      final categories = await _productRepository.getAllCategories();
      print('🏷️ Fetched ${categories.length} categories');
      allCategories.assignAll(categories);
      
      // Debug: Print category details
      for (var category in categories) {
        print('✓ Category: ${category.name} (${category.id})');
      }
    } catch (e) {
      print('❌ Error fetching categories: $e');
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // =========================== UTILITY METHODS ===========================

  /// Get product by ID
  Future<Product?> getProductById(String productId) async {
    try {
      return await _productRepository.getProductById(productId);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return null;
    }
  }

  /// Filter products by price range
  List<Product> getProductsByPriceRange(double minPrice, double maxPrice) {
    return allProducts
        .where((product) => product.price >= minPrice && product.price <= maxPrice)
        .toList();
  }

  /// Get products by brand
  List<Product> getProductsByBrand(String brand) {
    return allProducts
        .where((product) => product.brand.toLowerCase() == brand.toLowerCase())
        .toList();
  }

  /// Get products sorted by rating
  List<Product> getProductsSortedByRating() {
    final productsCopy = List<Product>.from(allProducts);
    productsCopy.sort((a, b) => b.rating.compareTo(a.rating));
    return productsCopy;
  }

  /// Get products sorted by price (low to high)
  List<Product> getProductsSortedByPriceLowToHigh() {
    final productsCopy = List<Product>.from(allProducts);
    productsCopy.sort((a, b) => a.price.compareTo(b.price));
    return productsCopy;
  }

  /// Get products sorted by price (high to low)
  List<Product> getProductsSortedByPriceHighToLow() {
    final productsCopy = List<Product>.from(allProducts);
    productsCopy.sort((a, b) => b.price.compareTo(a.price));
    return productsCopy;
  }

  /// Refresh all data
  Future<void> refreshData() async {
    await Future.wait([
      fetchAllProducts(),
      fetchFeaturedProducts(),
      fetchAllCategories(),
    ]);
  }
}
