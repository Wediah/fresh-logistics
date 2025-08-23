class Farm {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String location;
  final String contactInfo;
  final double rating;
  final int reviewCount;
  final bool isVerified;
  final bool isActive;

  Farm({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.location,
    required this.contactInfo,
    required this.rating,
    required this.reviewCount,
    required this.isVerified,
    required this.isActive,
  });

  // Convert to JSON for local storage/Firebase
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'location': location,
      'contactInfo': contactInfo,
      'rating': rating,
      'reviewCount': reviewCount,
      'isVerified': isVerified,
      'isActive': isActive,
    };
  }

  // Create from JSON from local storage
  factory Farm.fromJson(Map<String, dynamic> json) {
    return Farm(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      location: json['location'] ?? '',
      contactInfo: json['contactInfo'] ?? '',
      rating: (json['rating'] ?? 0.0).toDouble(),
      reviewCount: json['reviewCount'] ?? 0,
      isVerified: json['isVerified'] ?? false,
      isActive: json['isActive'] ?? true,
    );
  }

  // Create from Firebase DocumentSnapshot
  factory Farm.fromSnapshot(Map<String, dynamic> data, String documentId) {
    return Farm(
      id: documentId,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      location: data['location'] ?? '',
      contactInfo: data['contactInfo'] ?? '',
      rating: (data['rating'] ?? 0.0).toDouble(),
      reviewCount: data['reviewCount'] ?? 0,
      isVerified: data['isVerified'] ?? false,
      isActive: data['isActive'] ?? true,
    );
  }

  // Create a copy with updated fields
  Farm copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    String? location,
    String? contactInfo,
    double? rating,
    int? reviewCount,
    bool? isVerified,
    bool? isActive,
  }) {
    return Farm(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      location: location ?? this.location,
      contactInfo: contactInfo ?? this.contactInfo,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      isVerified: isVerified ?? this.isVerified,
      isActive: isActive ?? this.isActive,
    );
  }
}
