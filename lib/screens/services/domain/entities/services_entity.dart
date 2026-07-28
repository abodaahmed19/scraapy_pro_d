import 'package:scraapy_pro/screens/services/domain/entities/services_item_entity.dart';

class ServicesEntity {
  final int count;
  final String? next;
  final String? previous;
  final List<ServicesItemEntity> data;
  final List<CategoryEntity> categories;
  final PriceRangeEntity priceRange;

  ServicesEntity({
    required this.count,
    this.next,
    this.previous,
    required this.data,
    required this.categories,
    required this.priceRange,
  });

  factory ServicesEntity.fromJson(Map<String, dynamic> json) {
    final results = json['results'] as Map<String, dynamic>;
    return ServicesEntity(
      count: json['count'] ?? 0,
      next: json['next'],
      previous: json['previous'],
      data: (results['data'] as List).map((e) => ServicesItemEntity.fromJson(e)).toList(),
      categories: (results['categories'] as List).map((e) => CategoryEntity.fromJson(e)).toList(),
      priceRange: PriceRangeEntity.fromJson(results['price_range']),
    );
  }
}

class CategoryEntity {
  final int id;
  final String name;
  final String nameAr;
  final String icon;
  final String groupType;

  CategoryEntity({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.icon,
    required this.groupType,
  });

  factory CategoryEntity.fromJson(Map<String, dynamic> json) {
    return CategoryEntity(
      id: json['id'],
      name: json['name'] ?? '',
      nameAr: json['name_ar'] ?? '',
      icon: json['icon'] ?? '',
      groupType: json['group_type'] ?? '',
    );
  }
}

class PriceRangeEntity {
  final double minPrice;
  final double maxPrice;

  PriceRangeEntity({
    required this.minPrice,
    required this.maxPrice,
  });

  factory PriceRangeEntity.fromJson(Map<String, dynamic> json) {
    return PriceRangeEntity(
      minPrice: (json['min_price'] as num).toDouble(),
      maxPrice: (json['max_price'] as num).toDouble(),
    );
  }
}
