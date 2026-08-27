import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/core/error/api_exception.dart';
import 'package:scraapy_pro/screens/notifications/domain/use_cases/notifications_use_case.dart';
import 'package:scraapy_pro/screens/notifications/presentation/cubit/notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationsUseCase notificationsUseCase;

  NotificationsCubit(this.notificationsUseCase) : super(NotificationsInitial());

  Future<void> getNotifications() async {
    emit(NotificationsLoading());

    try {
      final response = await notificationsUseCase();
      emit(NotificationsLoaded(response));
    } on ApiException catch (e) {
      emit(NotificationsError(e.message));
    }
  }
}
