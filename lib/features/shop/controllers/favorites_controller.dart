import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:freshlogistics/features/shop/models/product_model.dart';
import 'package:freshlogistics/utils/popups/loaders.dart';

class FavoritesController extends GetxController {
  static FavoritesController get instance => Get.find();

  // Local storage
  final localStorage = GetStorage();

  // Observable list of favorite product IDs
  final RxList<String> favoriteProductIds = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  // Initialize favorites from local storage
  void initFavorites() {
    final favorites = localStorage.read<List<dynamic>>('favorites');
    if (favorites != null) {
      favoriteProductIds.assignAll(favorites.cast<String>());
    }
  }

  // Check if product is favorite
  bool isFavorite(String productId) {
    return favoriteProductIds.contains(productId);
  }

  // Toggle favorite status
  void toggleFavoriteProduct(Product product) {
    if (isFavorite(product.id)) {
      // Remove from favorites
      favoriteProductIds.remove(product.id);
      localStorage.write('favorites', favoriteProductIds);
      TLoaders.customToast(message: '${product.name} removed from favorites');
    } else {
      // Add to favorites
      favoriteProductIds.add(product.id);
      localStorage.write('favorites', favoriteProductIds);
      TLoaders.customToast(message: '${product.name} added to favorites');
    }
  }

  // Get all favorite products
  List<Product> getFavoriteProducts(List<Product> allProducts) {
    return allProducts.where((product) => favoriteProductIds.contains(product.id)).toList();
  }

  // Clear all favorites
  void clearFavorites() {
    favoriteProductIds.clear();
    localStorage.remove('favorites');
    TLoaders.customToast(message: 'All favorites cleared');
  }
}
