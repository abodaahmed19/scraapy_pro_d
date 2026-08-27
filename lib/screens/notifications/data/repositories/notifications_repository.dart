
import 'package:scraapy_pro/screens/notifications/data/data_source/notifications_data_source.dart';
import 'package:scraapy_pro/screens/notifications/domain/entities/notifications_entity.dart';

abstract class NotificationsRepository {
  Future <List<NotificationModel>> getAllNotifications();
}

class NotificationsRepositoryImpl implements NotificationsRepository {
  final NotificationsDataSource notificationsDataSource;

  NotificationsRepositoryImpl(this.notificationsDataSource);

  @override
  Future <List<NotificationModel>> getAllNotifications() async {
    return await notificationsDataSource.getAllNotifications();
  }
}
