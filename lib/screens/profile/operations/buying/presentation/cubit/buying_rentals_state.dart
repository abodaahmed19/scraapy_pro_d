import 'package:scraapy_pro/screens/profile/operations/buying/domain/entity/buying_entity.dart';

abstract class BuyingRentalsState {}

class BuyingRentalsInitial extends BuyingRentalsState {}

class BuyingRentalsLoading extends BuyingRentalsState {}

class BuyingRentalsLoaded extends BuyingRentalsState {
  final List<buyingOrderEntity> rentals;
  final bool hasMore;
  final bool isLoadingMore;

  BuyingRentalsLoaded({
    required this.rentals,
    required this.hasMore,
    this.isLoadingMore = false,
  });
}

class BuyingRentalsError extends BuyingRentalsState {
  final String message;

  BuyingRentalsError(this.message);
}
