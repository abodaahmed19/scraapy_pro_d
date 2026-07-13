import 'package:dio/dio.dart';
import 'package:scraapy_pro/screens/market/domain/entities/market_item_entity.dart';


abstract class MarketRemoteDataSource {
  Future<List<MarketItemEntity>> getMarket();
}

class MarketRemoteDataSourceImpl implements MarketRemoteDataSource {
  final Dio dio;

  MarketRemoteDataSourceImpl(this.dio);

  // @override
  // Future<List<ServiceEntity>> getServices() async {
  //   final response = await dio.get('/products');
  //
  //   return List<ServiceEntity>.from(
  //     response.data.map((e) => ServiceEntity.fromJson(e)),
  //   );
  // }

  @override
  Future<List<MarketItemEntity>> getMarket() async {
    await Future.delayed(const Duration(seconds: 1)); // simulate loading

    final mockResponse = [
      {
        "id": 1,
        "name": "منتج للتصدير",

      },
      {
        "id": 2,
        "name": "منتج محلي",

      },
      {
        "id": 3,
        "name": "منتج مميز",

      },
    ];

    return List<MarketItemEntity>.from(
      mockResponse.map((e) => MarketItemEntity.fromJson(e)),
    );
  }


}