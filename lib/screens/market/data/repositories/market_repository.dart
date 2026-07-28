import 'package:scraapy_pro/screens/market/data/data_source/market_data_source.dart';
import 'package:scraapy_pro/screens/market/domain/entities/market_entity.dart';

abstract class MarketRepository {
  Future<MarketEntity> getMarket();
}

class MarketRepositoryImpl implements MarketRepository {
  final MarketRemoteDataSource marketRemoteDataSource;

  MarketRepositoryImpl(this.marketRemoteDataSource);

  @override
  Future<MarketEntity> getMarket() async {
    return await marketRemoteDataSource.getMarket();
  }
}
