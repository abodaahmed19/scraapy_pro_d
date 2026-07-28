import 'package:dio/dio.dart';
import 'package:scraapy_pro/screens/market/domain/entities/market_entity.dart';

abstract class MarketRemoteDataSource {
  Future<MarketEntity> getMarket();
}

class MarketRemoteDataSourceImpl implements MarketRemoteDataSource {
  final Dio dio;

  MarketRemoteDataSourceImpl(this.dio);

  @override
  Future<MarketEntity> getMarket() async {
    final response = await dio.get('https://vmi2584358.contaboserver.net/api/inventory/items/store/');

    return MarketEntity.fromJson(response.data);
  }
}