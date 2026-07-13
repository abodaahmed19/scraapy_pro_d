class FavoriteItemModel {
  final int? id;
  final String? name;
  final String? hsCode;
  final String? traderName;
  final List<String>? images;
  final DateTime? createdAt;
  final double? price;

  FavoriteItemModel({
    this.id,
    this.name,
    this.hsCode,
    this.traderName,
    this.images,
    this.createdAt,
    this.price,
  });

  /// fromJson
  factory FavoriteItemModel.fromJson(Map<String, dynamic> json) {
    return FavoriteItemModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      hsCode: json['hs_code'] as String?,
      traderName: json['trader_name'] as String?,
      images: json['images'] != null
          ? List<String>.from(json['images'])
          : null,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      price: json['price'] != null
          ? double.tryParse(json['price'].toString())
          : null,
    );
  }

  /// toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'hs_code': hsCode,
      'trader_name': traderName,
      'images': images,
      'created_at': createdAt?.toIso8601String(),
      'price': price,
    };
  }

  /// List parser
  static List<FavoriteItemModel> listFromJson(List<dynamic> jsonList) {
    return jsonList
        .map((e) => FavoriteItemModel.fromJson(e))
        .toList();
  }
}