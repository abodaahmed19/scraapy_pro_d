import 'package:dio/dio.dart';
import 'package:scraapy_pro/screens/retals/domain/entities/retals_item_entity.dart';


abstract class RetalsRemoteDataSource {
  Future<List<RetalsItemEntity>> getRetals();
}

class RetalsRemoteDataSourceImpl implements RetalsRemoteDataSource {
  final Dio dio;

  RetalsRemoteDataSourceImpl(this.dio);

  // @override
  // Future<List<ServiceEntity>> getServices() async {
  //   final response = await dio.get('/products');
  //
  //   return List<ServiceEntity>.from(
  //     response.data.map((e) => ServiceEntity.fromJson(e)),
  //   );
  // }

  @override
  Future<List<RetalsItemEntity>> getRetals() async {
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

    return List<RetalsItemEntity>.from(
      mockResponse.map((e) => RetalsItemEntity.fromJson(e)),
    );
  }


}