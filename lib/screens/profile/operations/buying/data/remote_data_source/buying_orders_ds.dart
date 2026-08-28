import 'package:dio/dio.dart';
import 'package:scraapy_pro/core/config/res/constants_manager.dart';
import 'package:scraapy_pro/core/error/dio_error_handler.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/domain/entity/buying_entity.dart';

abstract class BuyingOrdersDs {
  Future<buyingOrdersEntity> getBuyingOrders(int page);
}

class BuyingOrdersDsImpl implements BuyingOrdersDs {
  final Dio dio;

  BuyingOrdersDsImpl(this.dio);

  @override
  Future<buyingOrdersEntity> getBuyingOrders(int page) async {
    try {
      final response = await dio.get(
        '${ConstantManager.baseUrl}/billing/orders/',
        queryParameters: {
          'group_type': 'service',
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
