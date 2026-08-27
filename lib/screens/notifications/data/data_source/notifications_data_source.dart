import 'package:dio/dio.dart';
import 'package:scraapy_pro/core/config/res/constants_manager.dart';
import 'package:scraapy_pro/core/di/injection.dart';
import 'package:scraapy_pro/core/error/dio_error_handler.dart';
import 'package:scraapy_pro/screens/notifications/domain/entities/notifications_entity.dart';

abstract class NotificationsDataSource {
  Future<List<NotificationModel>> getAllNotifications();
}

class NotificationsDataSourceImpl extends NotificationsDataSource {
  @override
  Future<List<NotificationModel>> getAllNotifications() async {
    try {
      final dio = getIt<Dio>();

      // Make sure it is the same registered Dio instance.
      print('DIO HASH: ${dio.hashCode}');

      final response = await dio.get(
        '${ConstantManager.baseUrl}/users/notifications/',
      );

      return (response.data as List)
          .map(
            (json) => NotificationModel.fromJson(
          json as Map<String, dynamic>,
        ),
      )
          .toList();
    } on DioException catch (e) {
      throw DioErrorHandler.handle(e);
    }
  }
}