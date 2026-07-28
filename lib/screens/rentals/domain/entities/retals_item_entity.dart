
class RentalsItemEntity {
  final int id;
  final List<RentalsItemImageEntity> images;
  final String name;
  final String price;
  final int quantity;
  final String city;
  final bool isFavorite;

  RentalsItemEntity({
    required this.id,
    required this.images,
    required this.name,
    required this.price,
    required this.quantity,
    required this.city,
    required this.isFavorite,
  });

  factory RentalsItemEntity.fromJson(Map<String, dynamic> json) {
    return RentalsItemEntity(
      id: json['id'],
      images: (json['images'] as List).map((e) => RentalsItemImageEntity.fromJson(e)).toList(),
      name: json['name'] ?? '',
      price: json['price']?.toString() ?? '0',
      quantity: json['quantity'] ?? 0,
      city: json['city'] ?? '',
      isFavorite: json['is_favorite'] ?? false,
    );
  }
}

class RentalsItemImageEntity {
  final int id;
  final String image;
  final bool isThumbnail;

  RentalsItemImageEntity({
    required this.id,
    required this.image,
    required this.isThumbnail,
  });

  factory RentalsItemImageEntity.fromJson(Map<String, dynamic> json) {
    return RentalsItemImageEntity(
      id: json['id'],
      image: json['image'] ?? '',
      isThumbnail: json['is_thumbnail'] ?? false,
    );
  }
}
