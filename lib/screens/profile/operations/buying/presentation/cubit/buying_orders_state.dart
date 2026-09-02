import 'package:scraapy_pro/screens/profile/operations/buying/domain/entity/buying_entity.dart';

abstract class BuyingOrdersState {}

class BuyingOrdersInitial extends BuyingOrdersState {}

class BuyingOrdersLoading extends BuyingOrdersState {}

class BuyingOrdersLoaded extends BuyingOrdersState {
  final List<buyingOrderEntity> orders;
  final bool hasMore;
  final bool isLoadingMore;

  BuyingOrdersLoaded({
    required this.orders,
    required this.hasMore,
    this.isLoadingMore = false,
  });
}

class BuyingOrdersError extends BuyingOrdersState {
  final String message;

  BuyingOrdersError(this.message);
}
