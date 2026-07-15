

import 'package:scraapy_pro/screens/rentals/domain/entities/retals_item_entity.dart';

abstract class RentalsState {}

class RentalsInitial extends RentalsState {}
class RentalsLoading extends RentalsState {}
class RentalsLoaded extends RentalsState {
  final List<RentalsItemEntity> retals;
  RentalsLoaded(this.retals);
}
class RentalsError extends RentalsState {
  final String message;
  RentalsError(this.message);
}