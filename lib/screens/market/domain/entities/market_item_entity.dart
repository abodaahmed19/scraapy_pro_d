class MarketItemEntity {
  final int id;
  final List<MarketItemImageEntity> images;
  final String name;
  final String price;
  final int quantity;
  final String city;
  final bool isFavorite;

  MarketItemEntity({
    required this.id,
    required this.images,
    required this.name,
    required this.price,
    required this.quantity,
    required this.city,
    required this.isFavorite,
  });

  factory MarketItemEntity.fromJson(Map<String, dynamic> json) {
    return MarketItemEntity(
      id: json['id'],
      images: (json['images'] as List).map((e) => MarketItemImageEntity.fromJson(e)).toList(),
      name: json['name'] ?? '',
      price: json['price']?.toString() ?? '0',
      quantity: json['quantity'] ?? 0,
      city: json['city'] ?? '',
      isFavorite: json['is_favorite'] ?? false,
    );
  }
}

class MarketItemImageEntity {
  final int id;
  final String image;
  final bool isThumbnail;

  MarketItemImageEntity({
    required this.id,
    required this.image,
    required this.isThumbnail,
  });

  factory MarketItemImageEntity.fromJson(Map<String, dynamic> json) {
    return MarketItemImageEntity(
      id: json['id'],
      image: json['image'] ?? '',
      isThumbnail: json['is_thumbnail'] ?? false,
    );
  }
}
