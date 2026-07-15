import 'package:dio/dio.dart';
import 'package:scraapy_pro/screens/rentals/domain/entities/retals_item_entity.dart';


abstract class RentalsRemoteDataSource {
  Future<List<RentalsItemEntity>> getRetals();
}

class RentalsRemoteDataSourceImpl implements RentalsRemoteDataSource {
  final Dio dio;

  RentalsRemoteDataSourceImpl(this.dio);

  // @override
  // Future<List<ServiceEntity>> getServices() async {
  //   final response = await dio.get('/products');
  //
  //   return List<ServiceEntity>.from(
  //     response.data.map((e) => ServiceEntity.fromJson(e)),
  //   );
  // }

  @override
  Future<List<RentalsItemEntity>> getRetals() async {
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

    return List<RentalsItemEntity>.from(
      mockResponse.map((e) => RentalsItemEntity.fromJson(e)),
    );
  }


}