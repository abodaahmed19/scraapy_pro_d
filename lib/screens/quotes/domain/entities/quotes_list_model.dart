class QuotesListModel {
  final ProductRentalServiceQuote products;
  final ProductRentalServiceQuote rentals;
  final ProductRentalServiceQuote services;
  final String grandTotal;
  final String tax_amount;
  final String grand_service_fees;
  final String grand_commission;
  final String grand_base_price;

  QuotesListModel({
    required this.products,
    required this.rentals,
    required this.services,
    required this.grandTotal,
    required this.tax_amount,
    required this.grand_service_fees,
    required this.grand_commission,
    required this.grand_base_price,
  });

  factory QuotesListModel.fromJson(Map<String, dynamic> json) {
    return QuotesListModel(
      products: ProductRentalServiceQuote.fromJson(json['products']),
      rentals: ProductRentalServiceQuote.fromJson(json['rentals']),
      services: ProductRentalServiceQuote.fromJson(json['services']),
      grandTotal: (json['grand_total'] ?? 0).toString(),
      tax_amount: (json['tax_amount'] ?? 0).toString(),
      grand_service_fees: (json['grand_service_fees'] ?? 0).toString(),
      grand_commission: (json['grand_commission'] ?? 0).toString(),
      grand_base_price: (json['grand_base_price'] ?? 0).toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'products': products.toJson(),
      'rentals': rentals.toJson(),
      'services': services.toJson(),
      'grand_total': grandTotal.toString(),
      'tax_amount': tax_amount.toString(),
      'grand_service_fees': grand_service_fees.toString(),
      'grand_commission': grand_commission.toString(),
      'grand_base_price': grand_base_price.toString(),
    };
  }
}

class ProductRentalServiceQuote {
  final List<QuoteDataItem> items;
  final double totalPrice;

  ProductRentalServiceQuote({
    required this.items,
    required this.totalPrice,
  });

  factory ProductRentalServiceQuote.fromJson(Map<String, dynamic> json) {
    return ProductRentalServiceQuote(
      items: (json['items'] as List)
          .map((item) => QuoteDataItem.fromJson(item))
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

class QuoteDataItem {
  final int id;
  final String name;
  final int quantity;
  final double price;
  final double totalPrice;

  QuoteDataItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.totalPrice,
  });

  factory QuoteDataItem.fromJson(Map<String, dynamic> json) {
    return QuoteDataItem(
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