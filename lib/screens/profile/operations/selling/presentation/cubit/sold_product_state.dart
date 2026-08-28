


import 'package:scraapy_pro/screens/profile/operations/buying/domain/entity/buying_entity.dart';

abstract class SoldProductState {}

class SoldProductInitial extends SoldProductState {}
class SoldProductLoading extends SoldProductState {}
class SoldProductLoaded extends SoldProductState {
  final SellingOrdersEntity soldProducts;
  SoldProductLoaded(this.soldProducts);
}
class SoldProductError extends SoldProductState {
  final String message;
  SoldProductError(this.message);
}