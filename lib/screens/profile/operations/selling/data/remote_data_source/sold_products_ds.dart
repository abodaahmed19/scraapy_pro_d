import 'package:dio/dio.dart';
import 'package:scraapy_pro/core/config/res/constants_manager.dart';
import 'package:scraapy_pro/core/di/injection.dart';
import 'package:scraapy_pro/core/error/dio_error_handler.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/domain/entity/buying_entity.dart';

abstract class SoldProductsDs {
  Future<SellingOrdersEntity> getSoldProducts();
}

class SoldProductsDsImpl implements SoldProductsDs {
  final Dio dio;

  SoldProductsDsImpl( this.dio);

  @override
  Future<SellingOrdersEntity> getSoldProducts() async {
    try {

      print('DIO HASH: ${dio.hashCode}');

      final response = await dio.get(
        '${ConstantManager.baseUrl}/billing/orders/',
        queryParameters: {
          'group_type': 'product',
          'page': 1,
          'query': '',
          'sort': '',
          'status': '',
          'type': 'sold',
        },
      );

      return SellingOrdersEntity.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw DioErrorHandler.handle(e);
    }
  }
}