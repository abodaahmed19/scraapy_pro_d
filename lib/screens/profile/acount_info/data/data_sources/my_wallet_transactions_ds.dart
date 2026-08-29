import 'package:dio/dio.dart';
import 'package:scraapy_pro/core/config/res/constants_manager.dart';
import 'package:scraapy_pro/core/di/injection.dart';
import 'package:scraapy_pro/core/error/dio_error_handler.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/entities/transactions_entity.dart';

abstract class MyWalletTransactionsDs {
  Future<List<MyWalletTransactionEntity>> getMyWalletTransactions();
}

class MyWalletTransactionsDsImpl extends MyWalletTransactionsDs {
  @override
  Future<List<MyWalletTransactionEntity>> getMyWalletTransactions() async {
    try {
      final dio = getIt<Dio>();

      final response = await dio.get(
        '${ConstantManager.baseUrl}/wallet/wallets/transactions/',
      );

      final data = response.data;
      if (data is Map<String, dynamic>) {
        final results = data['results'] as List? ?? [];
        return results
            .map((e) => MyWalletTransactionEntity.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      if (data is List) {
        return data
            .map((e) => MyWalletTransactionEntity.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return [];
    } on DioException catch (e) {
      throw DioErrorHandler.handle(e);
    }
  }
}
