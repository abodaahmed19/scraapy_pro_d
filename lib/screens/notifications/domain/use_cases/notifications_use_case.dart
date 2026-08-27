
import 'package:scraapy_pro/screens/notifications/data/repositories/notifications_repository.dart';
import 'package:scraapy_pro/screens/notifications/domain/entities/notifications_entity.dart';

class NotificationsUseCase {
  final NotificationsRepository repository;

  NotificationsUseCase(this.repository);

  Future<List<NotificationModel>> call() async {
    return await repository.getAllNotifications();
  }
}

