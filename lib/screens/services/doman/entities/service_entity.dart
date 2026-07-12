class ServiceEntity {
  final int id;
  final String? title;
  final String? description;
  final String? price;


  ServiceEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,

  });

  factory ServiceEntity.initial() => ServiceEntity(
    id: 0,
    title: '',
    description: '',
    price: '',

  );


  ServiceEntity copyWith({
    int? id,
    String? title,
    String? description,
    String? price,

  }) {
    return ServiceEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,

    );
  }

  factory ServiceEntity.fromJson(Map<String, dynamic> json) => ServiceEntity(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    price: json['price'],

  );

  static int _parseInt(Object? v) {
    if (v is int) return v;
    return int.tryParse(v?.toString() ?? '') ?? 0;
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "price": price,

  };
}
