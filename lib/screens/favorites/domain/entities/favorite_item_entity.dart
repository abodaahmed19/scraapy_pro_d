class FavoriteItemModel {
  final int? id;
  final String? name;
  final List<ItemImageModel>? images;
  final DateTime? createdAt;
  final double? price;
  final int? quantity;
  final String? city;
  final bool? isFavorite;
  final bool? isInRequest;

  FavoriteItemModel({
    this.id,
    this.name,
    this.images,
    this.createdAt,
    this.price,
    this.quantity,
    this.city,
    this.isFavorite,
    this.isInRequest,
  });

  factory FavoriteItemModel.fromJson(Map<String, dynamic> json) {
    return FavoriteItemModel(
      id: json['id'],
      name: json['name'],
      images: json['images'] != null
          ? (json['images'] as List)
          .map((e) => ItemImageModel.fromJson(e))
          .toList()
          : [],
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      price: json['price'] != null
          ? double.tryParse(json['price'].toString())
          : null,
      quantity: json['quantity'],
      city: json['city'],
      isFavorite: json['is_favorite'],
      isInRequest: json['is_in_request'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'images': images?.map((e) => e.toJson()).toList(),
      'created_at': createdAt?.toIso8601String(),
      'price': price,
      'quantity': quantity,
      'city': city,
      'is_favorite': isFavorite,
      'is_in_request': isInRequest,
    };
  }

  static List<FavoriteItemModel> listFromJson(List<dynamic> jsonList) {
    return jsonList
        .map((e) => FavoriteItemModel.fromJson(e))
        .toList();
  }
}

class ItemImageModel {
  final int? id;
  final String? image;
  final bool? isThumbnail;

  ItemImageModel({
    this.id,
    this.image,
    this.isThumbnail,
  });

  factory ItemImageModel.fromJson(Map<String, dynamic> json) {
    return ItemImageModel(
      id: json['id'],
      image: json['image'],
      isThumbnail: json['is_thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'is_thumbnail': isThumbnail,
    };
  }
}