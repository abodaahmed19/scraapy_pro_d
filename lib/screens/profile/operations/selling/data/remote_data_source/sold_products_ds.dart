import 'package:dio/dio.dart';
import 'package:scraapy_pro/core/config/res/constants_manager.dart';
import 'package:scraapy_pro/core/error/dio_error_handler.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/domain/entity/selling_entity.dart';

abstract class SoldProductsDs {
  Future<SellingOrdersEntity> getSoldProducts(int page);
}

class SoldProductsDsImpl implements SoldProductsDs {
  final Dio dio;

  SoldProductsDsImpl(this.dio);

  @override
  Future<SellingOrdersEntity> getSoldProducts(int page) async {
    try {
      final response = await dio.get(
        '${ConstantManager.baseUrl}/billing/orders/',
        queryParameters: {
          'group_type': 'product',
          'page': page,
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