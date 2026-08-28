import 'package:dio/dio.dart';
import 'package:scraapy_pro/core/config/res/constants_manager.dart';
import 'package:scraapy_pro/core/error/dio_error_handler.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/domain/entity/buying_entity.dart';

abstract class BoughtProductsDs {
  Future<buyingOrdersEntity> getBoughtProducts(int page);
}

class BoughtProductsDsImpl implements BoughtProductsDs {
  final Dio dio;

  BoughtProductsDsImpl(this.dio);

  @override
  Future<buyingOrdersEntity> getBoughtProducts(int page) async {
    try {
      final response = await dio.get(
        '${ConstantManager.baseUrl}/billing/orders/',
        queryParameters: {
          'group_type': 'product',
          'page': page,
          'query': '',
          'sort': '',
          'status': '',
          'type': 'bought',
        },
      );

      return buyingOrdersEntity.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw DioErrorHandler.handle(e);
    }
  }
}
