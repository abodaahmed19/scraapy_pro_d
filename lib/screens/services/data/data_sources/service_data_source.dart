import 'package:scraapy_pro/screens/services/doman/entities/service_entity.dart';

import 'package:dio/dio.dart';

abstract class ServiceRemoteDataSource {
  Future<List<ServiceEntity>> getServices();
}

class ServiceRemoteDataSourceImpl implements ServiceRemoteDataSource {
  final Dio dio;

  ServiceRemoteDataSourceImpl(this.dio);



  @override
  Future<List<ServiceEntity>> getServices() async {
    await Future.delayed(const Duration(seconds: 1)); // simulate loading

    final mockResponse = [
      {
        "id": 1,
        "name": "منتج للتصدير",
        "price": "1500",
        "quantity": "28",
      },
      {
        "id": 2,
        "name": "منتج محلي",
        "price": "900",
        "quantity": "15",
      },
      {
        "id": 3,
        "name": "منتج مميز",
        "price": "2000",
        "quantity": "8",
      },
    ];

    return List<ServiceEntity>.from(
      mockResponse.map((e) => ServiceEntity.fromJson(e)),
    );
  }


}