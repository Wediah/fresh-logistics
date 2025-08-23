class Product {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final String brand;
  final String category;
  final List<String> availableColors;
  final List<String> availableSizes;
  final int stockQuantity;
  final double rating;
  final int reviewCount;
  final bool isInStock;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.brand,
    required this.category,
    required this.availableColors,
    required this.availableSizes,
    required this.stockQuantity,
    required this.rating,
    required this.reviewCount,
    required this.isInStock,
  });

  // Convert to JSON for Firebase
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'brand': brand,
      'category': category,
      'availableColors': availableColors,
      'availableSizes': availableSizes,
      'stockQuantity': stockQuantity,
      'rating': rating,
      'reviewCount': reviewCount,
      'isInStock': isInStock,
    };
  }

  // Create from JSON from Firebase
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      brand: json['brand'] ?? '',
      category: json['category'] ?? '',
      availableColors: List<String>.from(json['availableColors'] ?? []),
      availableSizes: List<String>.from(json['availableSizes'] ?? []),
      stockQuantity: json['stockQuantity'] ?? 0,
      rating: (json['rating'] ?? 0.0).toDouble(),
      reviewCount: json['reviewCount'] ?? 0,
      isInStock: json['isInStock'] ?? false,
    );
  }

  // Create a copy with updated fields
  Product copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    double? price,
    String? brand,
    String? category,
    List<String>? availableColors,
    List<String>? availableSizes,
    int? stockQuantity,
    double? rating,
    int? reviewCount,
    bool? isInStock,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      brand: brand ?? this.brand,
      category: category ?? this.category,
      availableColors: availableColors ?? this.availableColors,
      availableSizes: availableSizes ?? this.availableSizes,
      stockQuantity: stockQuantity ?? this.stockQuantity,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      isInStock: isInStock ?? this.isInStock,
    );
  }
}
