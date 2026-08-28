import 'package:get_it/get_it.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/data/remote_data_source/buying_rentals_ds.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/data/repository/buying_rentals_repo.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/domain/use_cases/buying_rentals_use_case.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/presentation/cubit/buying_rentals_cubit.dart';

final getIt = GetIt.instance;

void setupBuyingRentalsDI() {
  // Data Source
  getIt.registerLazySingleton<BuyingRentalsDs>(
        () => BuyingRentalsDsImpl(getIt()),
  );

  // Repository
  getIt.registerLazySingleton<BuyingRentalsRepo>(
        () => BuyingRentalsRepoImpl(getIt()),
  );

  // Use Case
  getIt.registerLazySingleton<BuyingRentalsUseCase>(
        () => BuyingRentalsUseCase(getIt()),
  );

  // Cubit
  getIt.registerFactory<BuyingRentalsCubit>(
        () => BuyingRentalsCubit(getIt()),
  );
}
