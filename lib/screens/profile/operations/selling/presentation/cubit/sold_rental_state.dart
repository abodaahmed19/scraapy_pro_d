import 'package:scraapy_pro/screens/profile/operations/selling/domain/entity/selling_entity.dart';

abstract class SoldRentalState {}

class SoldRentalInitial extends SoldRentalState {}

class SoldRentalLoading extends SoldRentalState {}

class SoldRentalLoaded extends SoldRentalState {
  final List<SellingOrderEntity> products;
  final bool hasMore;
  final bool isLoadingMore;

  SoldRentalLoaded({
    required this.products,
    required this.hasMore,
    this.isLoadingMore = false,
  });
}

class SoldRentalError extends SoldRentalState {
  final String message;

  SoldRentalError(this.message);
}
