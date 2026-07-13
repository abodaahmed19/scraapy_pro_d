class ServiceResponseModel {
  final int? count;
  final String? next;
  final String? previous;
  final ServiceResultModel? results;

  ServiceResponseModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ServiceResponseModel.fromJson(Map<String, dynamic> json) {
    return ServiceResponseModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: json['results'] != null
          ? ServiceResultModel.fromJson(json['results'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'count': count,
    'next': next,
    'previous': previous,
    'results': results?.toJson(),
  };
}

/// ================= RESULT =================
class ServiceResultModel {
  final List<ServiceItemModel>? data;
  final List<CategoryModel>? categories;
  final PriceRangeModel? priceRange;

  ServiceResultModel({
    this.data,
    this.categories,
    this.priceRange,
  });

  factory ServiceResultModel.fromJson(Map<String, dynamic> json) {
    return ServiceResultModel(
      data: (json['data'] as List?)
          ?.map((e) => ServiceItemModel.fromJson(e))
          .toList(),
      categories: (json['categories'] as List?)
          ?.map((e) => CategoryModel.fromJson(e))
          .toList(),
      priceRange: json['price_range'] != null
          ? PriceRangeModel.fromJson(json['price_range'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'data': data?.map((e) => e.toJson()).toList(),
    'categories': categories?.map((e) => e.toJson()).toList(),
    'price_range': priceRange?.toJson(),
  };
}

/// ================= ITEM =================
class ServiceItemModel {
  final int? id;
  final List<ImageModel>? images;
  final String? name;
  final String? price;
  final int? quantity;
  final String? city;
  final bool? isFavorite;

  ServiceItemModel({
    this.id,
    this.images,
    this.name,
    this.price,
    this.quantity,
    this.city,
    this.isFavorite,
  });

  factory ServiceItemModel.fromJson(Map<String, dynamic> json) {
    return ServiceItemModel(
      id: json['id'],
      images: (json['images'] as List?)
          ?.map((e) => ImageModel.fromJson(e))
          .toList(),
      name: json['name'],
      price: json['price'],
      quantity: json['quantity'],
      city: json['city'],
      isFavorite: json['is_favorite'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'images': images?.map((e) => e.toJson()).toList(),
    'name': name,
    'price': price,
    'quantity': quantity,
    'city': city,
    'is_favorite': isFavorite,
  };
}

/// ================= IMAGE =================
class ImageModel {
  final int? id;
  final String? image;
  final bool? isThumbnail;

  ImageModel({
    this.id,
    this.image,
    this.isThumbnail,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      image: json['image'],
      isThumbnail: json['is_thumbnail'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'image': image,
    'is_thumbnail': isThumbnail,
  };
}

/// ================= CATEGORY =================
class CategoryModel {
  final int? id;
  final String? name;
  final String? nameAr;
  final String? icon;
  final String? groupType;

  CategoryModel({
    this.id,
    this.name,
    this.nameAr,
    this.icon,
    this.groupType,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      nameAr: json['name_ar'],
      icon: json['icon'],
      groupType: json['group_type'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'name_ar': nameAr,
    'icon': icon,
    'group_type': groupType,
  };
}

/// ================= PRICE RANGE =================
class PriceRangeModel {
  final int? minPrice;
  final int? maxPrice;

  PriceRangeModel({
    this.minPrice,
    this.maxPrice,
  });

  factory PriceRangeModel.fromJson(Map<String, dynamic> json) {
    return PriceRangeModel(
      minPrice: json['min_price'],
      maxPrice: json['max_price'],
    );
  }

  Map<String, dynamic> toJson() => {
    'min_price': minPrice,
    'max_price': maxPrice,
  };
}