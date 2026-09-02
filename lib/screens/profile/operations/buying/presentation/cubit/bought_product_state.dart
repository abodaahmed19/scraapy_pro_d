import 'package:scraapy_pro/screens/profile/operations/buying/domain/entity/buying_entity.dart';

abstract class BoughtProductState {}

class BoughtProductInitial extends BoughtProductState {}

class BoughtProductLoading extends BoughtProductState {}

class BoughtProductLoaded extends BoughtProductState {
  final List<buyingOrderEntity> products;
  final bool hasMore;
  final bool isLoadingMore;

  BoughtProductLoaded({
    required this.products,
    required this.hasMore,
    this.isLoadingMore = false,
  });
}

class BoughtProductError extends BoughtProductState {
  final String message;

  BoughtProductError(this.message);
}
