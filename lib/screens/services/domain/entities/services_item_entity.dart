class ServicesItemEntity {
  final int id;
  final List<ServicesItemImageEntity> images;
  final String name;
  final String price;
  final int quantity;
  final String city;
  final bool isFavorite;

  ServicesItemEntity({
    required this.id,
    required this.images,
    required this.name,
    required this.price,
    required this.quantity,
    required this.city,
    required this.isFavorite,
  });

  factory ServicesItemEntity.fromJson(Map<String, dynamic> json) {
    return ServicesItemEntity(
      id: json['id'],
      images: (json['images'] as List).map((e) => ServicesItemImageEntity.fromJson(e)).toList(),
      name: json['name'] ?? '',
      price: json['price']?.toString() ?? '0',
      quantity: json['quantity'] ?? 0,
      city: json['city'] ?? '',
      isFavorite: json['is_favorite'] ?? false,
    );
  }
}

class ServicesItemImageEntity {
  final int id;
  final String image;
  final bool isThumbnail;

  ServicesItemImageEntity({
    required this.id,
    required this.image,
    required this.isThumbnail,
  });

  factory ServicesItemImageEntity.fromJson(Map<String, dynamic> json) {
    return ServicesItemImageEntity(
      id: json['id'],
      image: json['image'] ?? '',
      isThumbnail: json['is_thumbnail'] ?? false,
    );
  }
}
