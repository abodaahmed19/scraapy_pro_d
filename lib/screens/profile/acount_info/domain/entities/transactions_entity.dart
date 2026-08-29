class MyWalletTransactionEntity {
  final String id;
  final String type;
  final String typeDisplay;
  final String amount;
  final String balanceAfter;
  final String description;
  final DateTime createdAt;
  final String? transferGroup;
  final String? counterparty;
  final String? counterpartyName;

  const MyWalletTransactionEntity({
    required this.id,
    required this.type,
    required this.typeDisplay,
    required this.amount,
    required this.balanceAfter,
    required this.description,
    required this.createdAt,
    this.transferGroup,
    this.counterparty,
    this.counterpartyName,
  });

  factory MyWalletTransactionEntity.fromJson(Map<String, dynamic> json) {
    return MyWalletTransactionEntity(
      id: json['id'] as String,
      type: json['type'] as String,
      typeDisplay: json['type_display'] as String,
      amount: json['amount'] as String,
      balanceAfter: json['balance_after'] as String,
      description: json['description'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      transferGroup: json['transfer_group'] as String?,
      counterparty: json['counterparty'] as String?,
      counterpartyName: json['counterparty_name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'type_display': typeDisplay,
      'amount': amount,
      'balance_after': balanceAfter,
      'description': description,
      'created_at': createdAt.toIso8601String(),
      'transfer_group': transferGroup,
      'counterparty': counterparty,
      'counterparty_name': counterpartyName,
    };
  }
}