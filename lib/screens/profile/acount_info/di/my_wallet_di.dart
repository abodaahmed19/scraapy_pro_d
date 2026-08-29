import 'package:get_it/get_it.dart';
import 'package:scraapy_pro/screens/notifications/data/data_source/notifications_data_source.dart';
import 'package:scraapy_pro/screens/notifications/data/repositories/notifications_repository.dart';
import 'package:scraapy_pro/screens/notifications/domain/use_cases/notifications_use_case.dart';
import 'package:scraapy_pro/screens/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:scraapy_pro/screens/profile/acount_info/data/data_sources/my_wallet_ds.dart';
import 'package:scraapy_pro/screens/profile/acount_info/data/repositories/my_wallet_repo.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/use_cases/my_wallet_use_case.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/cubit/my_wallet_cubit.dart';

final getIt = GetIt.instance;

void setupMyWalletDI() {
  // Data Source
  getIt.registerLazySingleton<MyWalletDs>(
        () => MyWalletDsImpl(),
  );

  // Repository
  getIt.registerLazySingleton<MyWalletRepo>(
        () => MyWalletRepoImpl(getIt()),
  );

  // Use Case
  getIt.registerLazySingleton<MyWalletUseCase>(
        () => MyWalletUseCase(getIt()),
  );

  // Cubit
  getIt.registerFactory<MyWalletCubit>(
        () => MyWalletCubit(getIt()),
  );
}