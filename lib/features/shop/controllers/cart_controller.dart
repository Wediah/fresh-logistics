import 'package:freshlogistics/features/shop/models/cart_item_model.dart';
import 'package:freshlogistics/features/shop/models/product_model.dart';
import 'package:freshlogistics/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  // Variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItem> cartItems = <CartItem>[].obs;
  final storage = GetStorage();

  @override
  void onInit() {
    loadCartItems();
    super.onInit();
  }

  // Load cart items from local storage
  void loadCartItems() {
    final cartData = storage.read<List>('cartItems');
    if (cartData != null) {
      cartItems.assignAll(cartData.map((item) => CartItem.fromJson(item)).toList());
      updateCartTotals();
    }
  }

  // Save cart items to local storage
  void saveCartItems() {
    final cartData = cartItems.map((item) => item.toJson()).toList();
    storage.write('cartItems', cartData);
  }

  // Add item to cart
  void addToCart(Product product, {int quantity = 1, String? selectedColor, String? selectedSize}) {
    try {
      // Generate unique cart item ID
      final cartItemId = '${product.id}_${selectedColor ?? 'default'}_${selectedSize ?? 'default'}';

      final cartItem = CartItem(
        id: cartItemId,
        productId: product.id,
        name: product.name,
        imageUrl: product.imageUrl,
        price: product.price,
        quantity: quantity,
        brand: product.brand,
        color: selectedColor ?? (product.availableColors.isNotEmpty ? product.availableColors.first : 'Default'),
        size: selectedSize ?? (product.availableSizes.isNotEmpty ? product.availableSizes.first : 'Default'),
      );

      final index = cartItems.indexWhere((cartItem) => cartItem.productId == product.id);
      
      if (index >= 0) {
        // Item exists, update quantity
        cartItems[index].quantity += quantity;
      } else {
        // New item, add to cart
        cartItems.add(cartItem);
      }
      
      updateCartTotals();
      saveCartItems();
      
      TLoaders.successSnackBar(title: 'Added to Cart', message: '${product.name} has been added to your cart');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Remove item from cart
  void removeFromCart(String productId) {
    try {
      cartItems.removeWhere((item) => item.productId == productId);
      updateCartTotals();
      saveCartItems();
      
      TLoaders.successSnackBar(title: 'Removed', message: 'Item has been removed from your cart');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Add one item to cart
  void addOneToCart(CartItem item) {
    try {
      final index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId);
      if (index >= 0) {
        cartItems[index].quantity += 1;
        updateCartTotals();
        saveCartItems();
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Remove one item from cart
  void removeOneFromCart(CartItem item) {
    try {
      final index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId);
      if (index >= 0) {
        if (item.quantity > 1) {
          cartItems[index].quantity -= 1;
        } else {
          // Show confirmation dialog before removing completely
          removeFromCartDialog(item.productId);
        }
        updateCartTotals();
        saveCartItems();
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  void removeFromCartDialog(String productId) {
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure you want to remove this product from the cart?',
      onConfirm: () {
        removeFromCart(productId);
        Get.back();
      },
      onCancel: () {},
    );
  }

  // Clear entire cart
  void clearCart() {
    Get.defaultDialog(
      title: 'Clear Cart',
      middleText: 'Are you sure you want to remove all items from the cart?',
      onConfirm: () async {
        try {
          cartItems.clear();
          updateCartTotals();
          saveCartItems();
          TLoaders.successSnackBar(title: 'Cart Cleared', message: 'All items have been removed from your cart');
          Get.back();
        } catch (e) {
          TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
        }
      },
      onCancel: () {},
    );
  }

  // Initialize product quantity for product detail screen
  void updateAlreadyAddedProductCount(Product product) {
    // Check if product already exists in cart and get its quantity
    productQuantityInCart.value = cartItems
        .where((item) => item.productId == product.id)
        .fold(0, (sum, item) => sum + item.quantity);
  }

  // Convert cart items to order format (for checkout)
  List<CartItem> get cartItemsList => cartItems.toList();

  // Check if cart is empty
  bool get isCartEmpty => cartItems.isEmpty;

  // Get formatted total price
  String get totalCartPriceFormatted => '\$${totalCartPrice.value.toStringAsFixed(2)}';

  // Get cart item by ID
  CartItem? getCartItem(String cartItemId) {
    try {
      return cartItems.firstWhere((item) => item.id == cartItemId);
    } catch (e) {
      return null;
    }
  }

  // Update cart totals
  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity;
      calculatedNoOfItems += item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  // Get quantity of specific product in cart
  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems.firstWhereOrNull((item) => item.productId == productId);
    return foundItem?.quantity ?? 0;
  }
}
