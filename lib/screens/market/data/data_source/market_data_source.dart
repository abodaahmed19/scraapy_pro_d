import 'package:dio/dio.dart';
import 'package:scraapy_pro/screens/market/domain/entities/market_entity.dart';
import 'package:scraapy_pro/screens/services/domain/entities/services_entity.dart';
import 'package:scraapy_pro/screens/services/domain/entities/services_item_entity.dart';

abstract class MarketRemoteDataSource {
  Future<ServicesEntity> getMarket();
}

class MarketRemoteDataSourceImpl implements MarketRemoteDataSource {
  final Dio dio;

  MarketRemoteDataSourceImpl(this.dio);

  @override
  Future<ServicesEntity> getMarket() async {
    final response = await dio.get('https://vmi2584358.contaboserver.net/api/inventory/items/store/');

    return ServicesEntity.fromJson(response.data);
  }
}