import 'package:dio/dio.dart';
import 'package:scraapy_pro/core/config/res/constants_manager.dart';
import 'package:scraapy_pro/core/di/injection.dart';
import 'package:scraapy_pro/core/error/dio_error_handler.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/entities/my_wallet_entity.dart';

abstract class MyWalletDs {
  Future<MyWalletEntity> getMyWalletData();
}

class MyWalletDsImpl extends MyWalletDs {
  @override
  Future<MyWalletEntity> getMyWalletData() async {
    try {
      final dio = getIt<Dio>();

      print('DIO HASH: ${dio.hashCode}');

      final response = await dio.get(
        '${ConstantManager.baseUrl}/wallet/wallets/me/',
      );

      return MyWalletEntity.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw DioErrorHandler.handle(e);
    }
  }
}