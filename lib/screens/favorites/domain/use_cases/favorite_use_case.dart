import 'package:scraapy_pro/screens/favorites/data/repositories/favorite_repository.dart';
import 'package:scraapy_pro/screens/favorites/domain/entities/favorite_item_entity.dart';


class GetFavoritesUseCase {
  final FavoriteRepository repository;

  GetFavoritesUseCase(this.repository);

  Future<List<FavoriteItemModel>> call() async {
    return await repository.getFavorite();
  }
}

