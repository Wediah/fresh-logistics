import 'package:freshlogistics/data/repositories/cart_repository.dart';
import 'package:freshlogistics/features/shop/models/cart_item_model.dart';
import 'package:freshlogistics/features/shop/models/product_model.dart';
import 'package:freshlogistics/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  // Variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItem> cartItems = <CartItem>[].obs;
  final cartRepository = Get.put(CartRepository());

  @override
  void onInit() {
    super.onInit();
    // Listen to cart changes
    updateCartValues();
  }

  void updateCartValues() {
    // Listen to cart items stream
    cartRepository.getCartItems().listen((items) {
      cartItems.assignAll(items);
      noOfCartItems.value = items.fold(0, (sum, item) => sum + item.quantity);
    });

    // Listen to cart total stream
    cartRepository.getCartTotal().listen((total) {
      totalCartPrice.value = total;
    });
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

      cartRepository.addToCart(cartItem);
      TLoaders.successSnackBar(title: 'Added to Cart', message: '${product.name} has been added to your cart');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Remove item from cart
  void removeFromCart(String cartItemId) {
    try {
      cartRepository.removeFromCart(cartItemId);
      TLoaders.successSnackBar(title: 'Removed', message: 'Item has been removed from your cart');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Add one item to cart
  void addOneToCart(CartItem item) {
    try {
      cartRepository.updateCartItemQuantity(item.id, item.quantity + 1);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Remove one item from cart
  void removeOneFromCart(CartItem item) {
    try {
      if (item.quantity > 1) {
        cartRepository.updateCartItemQuantity(item.id, item.quantity - 1);
      } else {
        // Show confirmation dialog before removing completely
        removeFromCartDialog(item.id);
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  void removeFromCartDialog(String cartItemId) {
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure you want to remove this product from the cart?',
      onConfirm: () {
        removeFromCart(cartItemId);
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
          await cartRepository.clearCart();
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
}
