class buyingOrdersEntity {
  final int count;
  final String? next;
  final String? previous;
  final List<buyingOrderEntity> results;

  const buyingOrdersEntity({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory buyingOrdersEntity.fromJson(Map<String, dynamic> json) {
    return buyingOrdersEntity(
      count: json['count'] ?? 0,
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>? ?? [])
          .map(
            (item) => buyingOrderEntity.fromJson(
          item as Map<String, dynamic>,
        ),
      )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results.map((item) => item.toJson()).toList(),
    };
  }
}

class buyingOrderEntity {
  final String id;
  final String orderNumber;
  final String orderDate;
  final String status;
  final double totalPrice;
  final int totalQuantity;

  const buyingOrderEntity({
    required this.id,
    required this.orderNumber,
    required this.orderDate,
    required this.status,
    required this.totalPrice,
    required this.totalQuantity,
  });

  factory buyingOrderEntity.fromJson(Map<String, dynamic> json) {
    return buyingOrderEntity(
      id: json['id'] ?? '',
      orderNumber: json['order_number'] ?? '',
      orderDate: json['order_date'] ?? '',
      status: json['status'] ?? '',
      totalPrice: (json['total_price'] as num?)?.toDouble() ?? 0.0,
      totalQuantity: json['total_quantity'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_number': orderNumber,
      'order_date': orderDate,
      'status': status,
      'total_price': totalPrice,
      'total_quantity': totalQuantity,
    };
  }
}