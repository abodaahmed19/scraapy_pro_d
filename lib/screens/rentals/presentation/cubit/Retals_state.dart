import 'package:scraapy_pro/screens/rentals/domain/entities/rentals_entity.dart';
import 'package:scraapy_pro/screens/services/domain/entities/services_entity.dart';

abstract class RentalsState {}

class RentalsInitial extends RentalsState {}
class RentalsLoading extends RentalsState {}
class RentalsLoaded extends RentalsState {
  final ServicesEntity response;
  RentalsLoaded(this.response);
}
class RentalsError extends RentalsState {
  final String message;
  RentalsError(this.message);
}