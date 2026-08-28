import 'package:scraapy_pro/screens/profile/operations/selling/domain/entity/selling_entity.dart';

abstract class SoldProductState {}

class SoldProductInitial extends SoldProductState {}

class SoldProductLoading extends SoldProductState {}

class SoldProductLoaded extends SoldProductState {
  final List<SellingOrderEntity> products;
  final bool hasMore;
  final bool isLoadingMore;

  SoldProductLoaded({
    required this.products,
    required this.hasMore,
    this.isLoadingMore = false,
  });
}

class SoldProductError extends SoldProductState {
  final String message;

  SoldProductError(this.message);
}