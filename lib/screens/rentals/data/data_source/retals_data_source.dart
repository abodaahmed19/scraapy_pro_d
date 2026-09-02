import 'package:dio/dio.dart';
import 'package:scraapy_pro/screens/rentals/domain/entities/rentals_entity.dart';
import 'package:scraapy_pro/screens/services/domain/entities/services_entity.dart';


abstract class RentalsRemoteDataSource {
  Future<ServicesEntity> getRentals();
}

class RentalsRemoteDataSourceImpl implements RentalsRemoteDataSource {
  final Dio dio;

  RentalsRemoteDataSourceImpl(this.dio);


  @override
  Future<ServicesEntity> getRentals() async {
    final response = await dio.get('https://vmi2584358.contaboserver.net/api/inventory/items/rental/');

    return ServicesEntity.fromJson(response.data);
  }

  // @override
  // Future<List<RentalsItemEntity>> getRetals() async {
  //   await Future.delayed(const Duration(seconds: 1)); // simulate loading
  //
  //   final mockResponse = [
  //     {
  //       "id": 1,
  //       "name": "منتج للتصدير",
  //
  //     },
  //     {
  //       "id": 2,
  //       "name": "منتج محلي",
  //
  //     },
  //     {
  //       "id": 3,
  //       "name": "منتج مميز",
  //
  //     },
  //   ];
  //
  //   return List<RentalsItemEntity>.from(
  //     mockResponse.map((e) => RentalsItemEntity.fromJson(e)),
  //   );
  // }


}