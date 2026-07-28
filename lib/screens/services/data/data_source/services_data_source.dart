import 'package:dio/dio.dart';
import 'package:scraapy_pro/screens/services/domain/entities/services_entity.dart';

abstract class ServicesRemoteDataSource {
  Future<ServicesEntity> getServices();
}

class ServicesRemoteDataSourceImpl implements ServicesRemoteDataSource {
  final Dio dio;

  ServicesRemoteDataSourceImpl(this.dio);

  @override
  Future<ServicesEntity> getServices() async {
    final response = await dio.get('https://vmi2584358.contaboserver.net/api/inventory/items/service/');

    return ServicesEntity.fromJson(response.data);
  }
}