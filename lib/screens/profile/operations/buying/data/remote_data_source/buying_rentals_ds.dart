import 'package:dio/dio.dart';
import 'package:scraapy_pro/core/config/res/constants_manager.dart';
import 'package:scraapy_pro/core/error/dio_error_handler.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/domain/entity/buying_entity.dart';

abstract class BuyingRentalsDs {
  Future<buyingOrdersEntity> getBuyingRentals(int page);
}

class BuyingRentalsDsImpl implements BuyingRentalsDs {
  final Dio dio;

  BuyingRentalsDsImpl(this.dio);

  @override
  Future<buyingOrdersEntity> getBuyingRentals(int page) async {
    try {
      final response = await dio.get(
        '${ConstantManager.baseUrl}/billing/orders/',
        queryParameters: {
          'group_type': 'rental',
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
