import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freshlogistics/features/shop/models/cart_item_model.dart';
import 'package:get/get.dart';

class CartRepository extends GetxService {
  static CartRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get current user ID
  String? get userId => _auth.currentUser?.uid;

  // Add item to cart
  Future<void> addToCart(CartItem cartItem) async {
    try {
      if (userId == null) throw 'User not authenticated';

      final docRef = _db
          .collection('users')
          .doc(userId)
          .collection('cart')
          .doc(cartItem.id);

      // Check if item already exists
      final doc = await docRef.get();
      if (doc.exists) {
        // If item exists, update quantity
        final existingItem = CartItem.fromJson(doc.data()!);
        await docRef.update({
          'quantity': existingItem.quantity + cartItem.quantity,
        });
      } else {
        // If item doesn't exist, add new item
        await docRef.set(cartItem.toJson());
      }
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Remove item from cart
  Future<void> removeFromCart(String cartItemId) async {
    try {
      if (userId == null) throw 'User not authenticated';

      await _db
          .collection('users')
          .doc(userId)
          .collection('cart')
          .doc(cartItemId)
          .delete();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Update item quantity
  Future<void> updateCartItemQuantity(String cartItemId, int quantity) async {
    try {
      if (userId == null) throw 'User not authenticated';

      if (quantity <= 0) {
        await removeFromCart(cartItemId);
        return;
      }

      await _db
          .collection('users')
          .doc(userId)
          .collection('cart')
          .doc(cartItemId)
          .update({'quantity': quantity});
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Get all cart items
  Stream<List<CartItem>> getCartItems() {
    if (userId == null) return Stream.value([]);

    return _db
        .collection('users')
        .doc(userId)
        .collection('cart')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => CartItem.fromJson(doc.data()))
            .toList());
  }

  // Get cart item count
  Stream<int> getCartItemCount() {
    if (userId == null) return Stream.value(0);

    return _db
        .collection('users')
        .doc(userId)
        .collection('cart')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => CartItem.fromJson(doc.data()).quantity)
            .fold(0, (sum, quantity) => sum + quantity));
  }

  // Clear entire cart
  Future<void> clearCart() async {
    try {
      if (userId == null) throw 'User not authenticated';

      final batch = _db.batch();
      final cartCollection = _db
          .collection('users')
          .doc(userId)
          .collection('cart');

      final docs = await cartCollection.get();
      for (final doc in docs.docs) {
        batch.delete(doc.reference);
      }

      await batch.commit();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Get cart total
  Stream<double> getCartTotal() {
    if (userId == null) return Stream.value(0.0);

    return _db
        .collection('users')
        .doc(userId)
        .collection('cart')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => CartItem.fromJson(doc.data()))
            .fold(0.0, (sum, item) => sum + item.totalPrice));
  }

  // Check if item is in cart
  Future<bool> isItemInCart(String productId) async {
    try {
      if (userId == null) return false;

      final querySnapshot = await _db
          .collection('users')
          .doc(userId)
          .collection('cart')
          .where('productId', isEqualTo: productId)
          .get();

      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}
