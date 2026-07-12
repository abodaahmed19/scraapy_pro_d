import 'package:scraapy_pro/screens/market/data/data_source/market_data_source.dart';
import 'package:scraapy_pro/screens/market/domain/entities/market_item_entity.dart';

abstract class MarketRepository {

  Future<List<MarketItemEntity>> getMarket();
}

class MarketRepositoryImpl implements MarketRepository{

  final MarketRemoteDataSource marketRemoteDataSource;

  MarketRepositoryImpl(this.marketRemoteDataSource);

  @override
  Future<List<MarketItemEntity>> getMarket() async{
     return await marketRemoteDataSource.getMarket();
  }




}