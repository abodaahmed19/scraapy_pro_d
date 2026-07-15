

import 'package:scraapy_pro/screens/services/domain/entities/services_item_entity.dart';

abstract class ServicesState {}

class ServicesInitial extends ServicesState {}
class ServicesLoading extends ServicesState {}
class ServicesLoaded extends ServicesState {
  final List<ServicesItemEntity> markets;
  ServicesLoaded(this.markets);
}
class ServicesError extends ServicesState {
  final String message;
  ServicesError(this.message);
}