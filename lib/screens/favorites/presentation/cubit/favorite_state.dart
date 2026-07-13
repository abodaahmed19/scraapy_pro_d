

import 'package:scraapy_pro/screens/favorites/domain/entities/favorite_item_entity.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}
class FavoriteLoading extends FavoriteState {}
class FavoriteLoaded extends FavoriteState {
  final List<FavoriteItemModel> favorites;
  FavoriteLoaded(this.favorites);
}
class FavoriteError extends FavoriteState {
  final String message;
  FavoriteError(this.message);
}