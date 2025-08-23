class Product {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final String brand;
  final String category;
  final String farmId; // Added farm field
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
    this.farmId = '', // Optional farm field
    required this.availableColors,
    required this.availableSizes,
    required this.stockQuantity,
    required this.rating,
    required this.reviewCount,
    required this.isInStock,
  });

  // Convert to JSON for local storage
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'brand': brand,
      'category': category,
      'farmId': farmId,
      'availableColors': availableColors,
      'availableSizes': availableSizes,
      'stockQuantity': stockQuantity,
      'rating': rating,
      'reviewCount': reviewCount,
      'isInStock': isInStock,
    };
  }

  // Create from JSON from local storage
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      brand: json['brand'] ?? '',
      category: json['category'] ?? '',
      farmId: json['farmId'] ?? '',
      availableColors: List<String>.from(json['availableColors'] ?? []),
      availableSizes: List<String>.from(json['availableSizes'] ?? []),
      stockQuantity: json['stockQuantity'] ?? 0,
      rating: (json['rating'] ?? 0.0).toDouble(),
      reviewCount: json['reviewCount'] ?? 0,
      isInStock: json['isInStock'] ?? false,
    );
  }

  // Create from Firebase DocumentSnapshot
  factory Product.fromSnapshot(Map<String, dynamic> data, String documentId) {
    return Product(
      id: documentId,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      price: (data['price'] ?? 0.0).toDouble(),
      brand: data['brand'] ?? '',
      category: data['category'] ?? '',
      farmId: data['farmId'] ?? '',
      availableColors: List<String>.from(data['availableColors'] ?? []),
      availableSizes: List<String>.from(data['availableSizes'] ?? []),
      stockQuantity: data['stockQuantity'] ?? 0,
      rating: (data['rating'] ?? 0.0).toDouble(),
      reviewCount: data['reviewCount'] ?? 0,
      isInStock: data['isInStock'] ?? true,
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
    String? farmId,
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
      farmId: farmId ?? this.farmId,
      availableColors: availableColors ?? this.availableColors,
      availableSizes: availableSizes ?? this.availableSizes,
      stockQuantity: stockQuantity ?? this.stockQuantity,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      isInStock: isInStock ?? this.isInStock,
    );
  }
}
