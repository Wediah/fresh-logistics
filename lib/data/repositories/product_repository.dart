import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freshlogistics/features/shop/models/category_model.dart';
import 'package:freshlogistics/features/shop/models/farm_model.dart';
import 'package:freshlogistics/features/shop/models/product_model.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxService {
  static ProductRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // =========================== CATEGORIES ===========================

  /// Fetch all categories from Firebase
  Future<List<Category>> getAllCategories() async {
    try {
      final snapshot = await _db
          .collection('categories')
          .where('isActive', isEqualTo: true)
          .get();

      // Sort manually to avoid index requirement
      final categories = snapshot.docs
          .map((doc) => Category.fromSnapshot(doc.data(), doc.id))
          .toList();
      
      categories.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
      return categories;
    } catch (e) {
      print('❌ Error fetching categories: $e');
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get categories as stream for real-time updates
  Stream<List<Category>> getCategoriesStream() {
    return _db
        .collection('categories')
        .where('isActive', isEqualTo: true)
        .snapshots()
        .map((snapshot) {
          final categories = snapshot.docs
              .map((doc) => Category.fromSnapshot(doc.data(), doc.id))
              .toList();
          
          // Sort manually to avoid index requirement
          categories.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
          return categories;
        });
  }

  /// Add a new category to Firebase
  Future<void> addCategory(Category category) async {
    try {
      // Use the category ID as the document ID if provided, otherwise let Firebase generate one
      if (category.id.isNotEmpty) {
        await _db.collection('categories').doc(category.id).set(category.toJson());
      } else {
        await _db.collection('categories').add(category.toJson());
      }
    } catch (e) {
      print('❌ Error adding category ${category.name}: $e');
      throw 'Something went wrong. Please try again';
    }
  }

  /// Update category in Firebase
  Future<void> updateCategory(Category category) async {
    try {
      await _db
          .collection('categories')
          .doc(category.id)
          .update(category.toJson());
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // =========================== PRODUCTS ===========================

  /// Fetch all products from Firebase
  Future<List<Product>> getAllProducts() async {
    try {
      final snapshot = await _db
          .collection('products')
          .where('isInStock', isEqualTo: true)
          .get();

      return snapshot.docs
          .map((doc) => Product.fromSnapshot(doc.data(), doc.id))
          .toList();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get products as stream for real-time updates
  Stream<List<Product>> getProductsStream() {
    return _db
        .collection('products')
        .where('isInStock', isEqualTo: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Product.fromSnapshot(doc.data(), doc.id))
            .toList());
  }

  /// Fetch products by category
  Future<List<Product>> getProductsByCategory(String categoryId) async {
    try {
      final snapshot = await _db
          .collection('products')
          .where('category', isEqualTo: categoryId)
          .where('isInStock', isEqualTo: true)
          .get();

      return snapshot.docs
          .map((doc) => Product.fromSnapshot(doc.data(), doc.id))
          .toList();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Search products by name or description
  Future<List<Product>> searchProducts(String searchTerm) async {
    try {
      final snapshot = await _db
          .collection('products')
          .where('isInStock', isEqualTo: true)
          .get();

      // Filter locally since Firestore doesn't support text search well
      return snapshot.docs
          .map((doc) => Product.fromSnapshot(doc.data(), doc.id))
          .where((product) =>
              product.name.toLowerCase().contains(searchTerm.toLowerCase()) ||
              product.description.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get featured products (you can add a 'featured' field to products)
  Future<List<Product>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('products')
          .where('isInStock', isEqualTo: true)
          .where('featured', isEqualTo: true)
          .limit(10)
          .get();

      return snapshot.docs
          .map((doc) => Product.fromSnapshot(doc.data(), doc.id))
          .toList();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Add a new product to Firebase
  Future<void> addProduct(Product product) async {
    try {
      await _db.collection('products').add(product.toJson());
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Update product in Firebase
  Future<void> updateProduct(Product product) async {
    try {
      await _db
          .collection('products')
          .doc(product.id)
          .update(product.toJson());
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Delete product from Firebase
  Future<void> deleteProduct(String productId) async {
    try {
      await _db.collection('products').doc(productId).delete();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get single product by ID
  Future<Product?> getProductById(String productId) async {
    try {
      final doc = await _db.collection('products').doc(productId).get();
      if (doc.exists) {
        return Product.fromSnapshot(doc.data()!, doc.id);
      }
      return null;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // =========================== FARMS ===========================

  /// Fetch all farms from Firebase
  Future<List<Farm>> getAllFarms() async {
    try {
      final snapshot = await _db
          .collection('farms')
          .where('isActive', isEqualTo: true)
          .get();

      final farms = snapshot.docs
          .map((doc) => Farm.fromSnapshot(doc.data(), doc.id))
          .toList();
      
      // Sort by rating (highest first)
      farms.sort((a, b) => b.rating.compareTo(a.rating));
      return farms;
    } catch (e) {
      print('❌ Error fetching farms: $e');
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get products by farm ID
  Future<List<Product>> getProductsByFarm(String farmId) async {
    try {
      final snapshot = await _db
          .collection('products')
          .where('farmId', isEqualTo: farmId)
          .where('isInStock', isEqualTo: true)
          .get();

      final products = snapshot.docs
          .map((doc) => Product.fromSnapshot(doc.data(), doc.id))
          .toList();
      
      // Sort by rating (highest first)
      products.sort((a, b) => b.rating.compareTo(a.rating));
      return products;
    } catch (e) {
      print('❌ Error fetching products by farm: $e');
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get farms as stream for real-time updates
  Stream<List<Farm>> getFarmsStream() {
    return _db
        .collection('farms')
        .where('isActive', isEqualTo: true)
        .snapshots()
        .map((snapshot) {
          final farms = snapshot.docs
              .map((doc) => Farm.fromSnapshot(doc.data(), doc.id))
              .toList();
          
          farms.sort((a, b) => b.rating.compareTo(a.rating));
          return farms;
        });
  }

  /// Add farm to Firebase
  Future<void> addFarm(Farm farm) async {
    try {
      await _db.collection('farms').doc(farm.id).set(farm.toJson());
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Update farm in Firebase
  Future<void> updateFarm(Farm farm) async {
    try {
      await _db.collection('farms').doc(farm.id).update(farm.toJson());
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Delete farm from Firebase
  Future<void> deleteFarm(String farmId) async {
    try {
      await _db.collection('farms').doc(farmId).delete();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get single farm by ID
  Future<Farm?> getFarmById(String farmId) async {
    try {
      final doc = await _db.collection('farms').doc(farmId).get();
      if (doc.exists) {
        return Farm.fromSnapshot(doc.data()!, doc.id);
      }
      return null;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
