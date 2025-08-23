class Category {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String iconUrl;
  final bool isActive;
  final int sortOrder;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.iconUrl,
    required this.isActive,
    required this.sortOrder,
  });

  // Convert to JSON for Firebase
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'iconUrl': iconUrl,
      'isActive': isActive,
      'sortOrder': sortOrder,
    };
  }

  // Convert to JSON with ID (for cases where ID needs to be included)
  Map<String, dynamic> toJsonWithId() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'iconUrl': iconUrl,
      'isActive': isActive,
      'sortOrder': sortOrder,
    };
  }

  // Create from Firebase JSON
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      iconUrl: json['iconUrl'] ?? '',
      isActive: json['isActive'] ?? true,
      sortOrder: json['sortOrder'] ?? 0,
    );
  }

  // Create from Firebase DocumentSnapshot
  factory Category.fromSnapshot(Map<String, dynamic> data, String documentId) {
    return Category(
      id: documentId,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      iconUrl: data['iconUrl'] ?? '',
      isActive: data['isActive'] ?? true,
      sortOrder: data['sortOrder'] ?? 0,
    );
  }

  // Create a copy with updated fields
  Category copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    String? iconUrl,
    bool? isActive,
    int? sortOrder,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      iconUrl: iconUrl ?? this.iconUrl,
      isActive: isActive ?? this.isActive,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }
}
