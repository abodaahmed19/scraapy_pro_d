import 'package:scraapy_pro/screens/market/data/data_source/market_data_source.dart';
import 'package:scraapy_pro/screens/services/domain/entities/services_entity.dart';

abstract class MarketRepository {
  Future<ServicesEntity> getMarket();
}

class MarketRepositoryImpl implements MarketRepository {
  final MarketRemoteDataSource marketRemoteDataSource;

  MarketRepositoryImpl(this.marketRemoteDataSource);

  @override
  Future<ServicesEntity> getMarket() async {
    return await marketRemoteDataSource.getMarket();
  }
}
