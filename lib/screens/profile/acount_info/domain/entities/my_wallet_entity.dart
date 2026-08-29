class MyWalletEntity {
  final int id;
  final int user;
  final String balance;
  final String currency;
  final DateTime? updatedAt;

  MyWalletEntity({
    required this.id,
    required this.user,
    required this.balance,
    required this.currency,
    this.updatedAt,
  });

  factory MyWalletEntity.fromJson(Map<String, dynamic> json) {
    return MyWalletEntity(
      id: json['id'] as int,
      user: json['user'] as int,
      balance: json['balance'] as String,
      currency: json['currency'] as String,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user,
      'balance': balance,
      'currency': currency,
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}