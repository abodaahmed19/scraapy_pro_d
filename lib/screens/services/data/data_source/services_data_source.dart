import 'package:dio/dio.dart';
import 'package:scraapy_pro/screens/services/domain/entities/services_item_entity.dart';


abstract class ServicesRemoteDataSource {
  Future<List<ServicesItemEntity>> getServices();
}

class ServicesRemoteDataSourceImpl implements ServicesRemoteDataSource {
  final Dio dio;

  ServicesRemoteDataSourceImpl(this.dio);

  // @override
  // Future<List<ServiceEntity>> getServices() async {
  //   final response = await dio.get('/products');
  //
  //   return List<ServiceEntity>.from(
  //     response.data.map((e) => ServiceEntity.fromJson(e)),
  //   );
  // }

  @override
  Future<List<ServicesItemEntity>> getServices() async {
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

    return List<ServicesItemEntity>.from(
      mockResponse.map((e) => ServicesItemEntity.fromJson(e)),
    );
  }


}