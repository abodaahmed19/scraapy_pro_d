class QuotesListModel {
  final ProductRentalServiceSection products;
  final ProductRentalServiceSection rentals;
  final ProductRentalServiceSection services;
  final double grandTotal;

  QuotesListModel({
    required this.products,
    required this.rentals,
    required this.services,
    required this.grandTotal,
  });

  factory QuotesListModel.fromJson(Map<String, dynamic> json) {
    return QuotesListModel(
      products: ProductRentalServiceSection.fromJson(json['products']),
      rentals: ProductRentalServiceSection.fromJson(json['rentals']),
      services: ProductRentalServiceSection.fromJson(json['services']),
      grandTotal: double.parse(json['grand_total'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'products': products.toJson(),
      'rentals': rentals.toJson(),
      'services': services.toJson(),
      'grand_total': grandTotal.toString(),
    };
  }
}

class ProductRentalServiceSection {
  final List<ProductRentalServiceItem> items;
  final double totalPrice;

  ProductRentalServiceSection({
    required this.items,
    required this.totalPrice,
  });

  factory ProductRentalServiceSection.fromJson(Map<String, dynamic> json) {
    return ProductRentalServiceSection(
      items: (json['items'] as List)
          .map((item) => ProductRentalServiceItem.fromJson(item))
          .toList(),
      totalPrice: double.parse(json['total_price'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
      'total_price': totalPrice.toString(),
    };
  }
}

class ProductRentalServiceItem {
  final int id;
  final String name;
  final int quantity;
  final double price;
  final double totalPrice;

  ProductRentalServiceItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.totalPrice,
  });

  factory ProductRentalServiceItem.fromJson(Map<String, dynamic> json) {
    return ProductRentalServiceItem(
      id: json['id'],
      name: json['name'],
      quantity: json['quantity'],
      price: double.parse(json['price'].toString()),
      totalPrice: double.parse(json['total_price'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'price': price.toString(),
      'total_price': totalPrice.toString(),
    };
  }
}