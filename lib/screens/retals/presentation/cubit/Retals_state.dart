

import 'package:scraapy_pro/screens/retals/domain/entities/retals_item_entity.dart';

abstract class RetalsState {}

class RetalsInitial extends RetalsState {}
class RetalsLoading extends RetalsState {}
class RetalsLoaded extends RetalsState {
  final List<RetalsItemEntity> retals;
  RetalsLoaded(this.retals);
}
class RetalsError extends RetalsState {
  final String message;
  RetalsError(this.message);
}