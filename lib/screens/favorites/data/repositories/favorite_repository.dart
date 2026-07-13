import 'package:scraapy_pro/screens/favorites/data/favorite_data_source/favorite_data_source.dart';
import 'package:scraapy_pro/screens/favorites/domain/entities/favorite_item_entity.dart';

abstract class FavoriteRepository {

  Future<List<FavoriteItemModel>> getFavorite();
}

class FavoriteRepositoryImpl implements FavoriteRepository{

  final FavoriteRemoteDataSource favoriteRemoteDataSource;

  FavoriteRepositoryImpl(this.favoriteRemoteDataSource);

  @override
  Future<List<FavoriteItemModel>> getFavorite() async{
     return await favoriteRemoteDataSource.getFavorites();
  }




}