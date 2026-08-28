import 'package:get_it/get_it.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/data/remote_data_source/buying_orders_ds.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/data/repository/buying_orders_repo.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/domain/use_cases/buying_orders_use_case.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/presentation/cubit/buying_orders_cubit.dart';

final getIt = GetIt.instance;

void setupBuyingOrdersDI() {
  // Data Source
  getIt.registerLazySingleton<BuyingOrdersDs>(
        () => BuyingOrdersDsImpl(getIt()),
  );

  // Repository
  getIt.registerLazySingleton<BuyingOrdersRepo>(
        () => BuyingOrdersRepoImpl(getIt()),
  );

  // Use Case
  getIt.registerLazySingleton<BuyingOrdersUseCase>(
        () => BuyingOrdersUseCase(getIt()),
  );

  // Cubit
  getIt.registerFactory<BuyingOrdersCubit>(
        () => BuyingOrdersCubit(getIt()),
  );
}
