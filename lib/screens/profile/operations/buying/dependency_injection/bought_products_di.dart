import 'package:get_it/get_it.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/data/remote_data_source/bought_products_ds.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/data/repository/bought_products_repo.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/domain/use_cases/bought_products_use_case.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/presentation/cubit/bought_product_cubit.dart';

final getIt = GetIt.instance;

void setupBoughtProductsDI() {
  // Data Source
  getIt.registerLazySingleton<BoughtProductsDs>(
        () => BoughtProductsDsImpl(getIt()),
  );

  // Repository
  getIt.registerLazySingleton<BoughtProductsRepo>(
        () => BoughtProductsRepoImpl(getIt()),
  );

  // Use Case
  getIt.registerLazySingleton<BoughtProductsUseCase>(
        () => BoughtProductsUseCase(getIt()),
  );

  // Cubit
  getIt.registerFactory<BoughtProductCubit>(
        () => BoughtProductCubit(getIt()),
  );
}
