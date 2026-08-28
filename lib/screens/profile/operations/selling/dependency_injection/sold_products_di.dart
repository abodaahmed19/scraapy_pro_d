import 'package:get_it/get_it.dart';
import 'package:scraapy_pro/screens/notifications/data/data_source/notifications_data_source.dart';
import 'package:scraapy_pro/screens/notifications/data/repositories/notifications_repository.dart';
import 'package:scraapy_pro/screens/notifications/domain/use_cases/notifications_use_case.dart';
import 'package:scraapy_pro/screens/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/data/remote_data_source/sold_products_ds.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/data/repository/sold_products_repo.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/domain/use_cases/sold_products_use_case.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/presentation/cubit/sold_product_cubit.dart';

final getIt = GetIt.instance;

void setupSoldProductsDI() {
  // Data Source
  getIt.registerLazySingleton<SoldProductsDs>(
        () => SoldProductsDsImpl(getIt()),
  );

  // Repository
  getIt.registerLazySingleton<SoldProductsRepo>(
        () => SoldProductsRepoImpl(getIt()),
  );

  // Use Case
  getIt.registerLazySingleton<SoldProductsUseCase>(
        () => SoldProductsUseCase(getIt()),
  );

  // Cubit
  getIt.registerFactory<SoldProductCubit>(
        () => SoldProductCubit(getIt()),
  );
}