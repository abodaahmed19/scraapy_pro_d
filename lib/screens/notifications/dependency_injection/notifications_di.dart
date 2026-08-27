import 'package:get_it/get_it.dart';
import 'package:scraapy_pro/screens/notifications/data/data_source/notifications_data_source.dart';
import 'package:scraapy_pro/screens/notifications/data/repositories/notifications_repository.dart';
import 'package:scraapy_pro/screens/notifications/domain/use_cases/notifications_use_case.dart';
import 'package:scraapy_pro/screens/notifications/presentation/cubit/notifications_cubit.dart';

final getIt = GetIt.instance;

void setupNotificationsDI() {
  // Data Source
  getIt.registerLazySingleton<NotificationsDataSource>(
        () => NotificationsDataSourceImpl(),
  );

  // Repository
  getIt.registerLazySingleton<NotificationsRepository>(
        () => NotificationsRepositoryImpl(getIt()),
  );

  // Use Case
  getIt.registerLazySingleton<NotificationsUseCase>(
        () => NotificationsUseCase(getIt()),
  );

  // Cubit
  getIt.registerFactory<NotificationsCubit>(
        () => NotificationsCubit(getIt()),
  );
}