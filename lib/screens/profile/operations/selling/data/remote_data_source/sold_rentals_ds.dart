import 'package:dio/dio.dart';
import 'package:scraapy_pro/core/config/res/constants_manager.dart';
import 'package:scraapy_pro/core/error/dio_error_handler.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/domain/entity/selling_entity.dart';

abstract class SoldRentalsDs {
  Future<SellingOrdersEntity> getSoldRentals(int page);
}

class SoldRentalsDsImpl implements SoldRentalsDs {
  final Dio dio;

  SoldRentalsDsImpl(this.dio);

  @override
  Future<SellingOrdersEntity> getSoldRentals(int page) async {
    try {
      final response = await dio.get(
        '${ConstantManager.baseUrl}/billing/orders/',
        queryParameters: {
          'group_type': 'rental',
          'type': 'sold',
          'page': page,
          'query': '',
          'status': '',
          'sort': '',
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