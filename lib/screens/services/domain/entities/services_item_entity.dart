class ServicesItemEntity {
  final int id;
  final String? name;
  final String? nameAr;
  final String? image;
  final String? priceDollar;
  final String? priceRiyal;
  final DateTime? created;
  final int? category;

  ServicesItemEntity({
    required this.id,
    required this.name,
     this.nameAr,
     this.image,
     this.priceDollar,
     this.priceRiyal,
     this.created,
     this.category,
  });

  factory ServicesItemEntity.fromJson(Map<String, dynamic> json) {
    return ServicesItemEntity(
      id: json['id'],
      name: json['name'],
      // nameAr: json['name_ar'],
      // image: json['image'],
      // priceDollar: json['price_dollar'],
      // priceRiyal: json['price_riyal'],
      // created: DateTime.parse(json['created']),
      // category: json['category'],
    );
  }
}