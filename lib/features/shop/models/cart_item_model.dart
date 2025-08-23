class CartItem {
  final String id;
  final String productId;
  final String name;
  final String imageUrl;
  final double price;
  int quantity;
  final String brand;
  final String color;
  final String size;

  CartItem({
    required this.id,
    required this.productId,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
    required this.brand,
    required this.color,
    required this.size,
  });

  // Calculate total price for this item
  double get totalPrice => price * quantity;

  // Convert to JSON for Firebase
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
      'brand': brand,
      'color': color,
      'size': size,
    };
  }

  // Create from JSON from Firebase
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'] ?? '',
      productId: json['productId'] ?? '',
      name: json['name'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      quantity: json['quantity'] ?? 1,
      brand: json['brand'] ?? '',
      color: json['color'] ?? '',
      size: json['size'] ?? '',
    );
  }

  // Create a copy with updated fields
  CartItem copyWith({
    String? id,
    String? productId,
    String? name,
    String? imageUrl,
    double? price,
    int? quantity,
    String? brand,
    String? color,
    String? size,
  }) {
    return CartItem(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      brand: brand ?? this.brand,
      color: color ?? this.color,
      size: size ?? this.size,
    );
  }
}
