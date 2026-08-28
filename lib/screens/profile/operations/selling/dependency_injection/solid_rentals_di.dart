import 'package:get_it/get_it.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/data/remote_data_source/sold_products_ds.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/data/remote_data_source/sold_rentals_ds.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/data/repository/sold_products_repo.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/data/repository/sold_rentals_repo.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/domain/use_cases/sold_products_use_case.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/domain/use_cases/sold_rentals_use_case.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/presentation/cubit/sold_product_cubit.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/presentation/cubit/sold_rental_cubit.dart';

final getIt = GetIt.instance;

void setupSoldRentalsDI() {


  // Rentals Data Source
  getIt.registerLazySingleton<SoldRentalsDs>(
        () => SoldRentalsDsImpl(getIt()),
  );

  // Rentals Repository
  getIt.registerLazySingleton<SoldRentalsRepo>(
        () => SoldRentalsRepoImpl(getIt()),
  );

  // Rentals Use Case
  getIt.registerLazySingleton<SoldRentalsUseCase>(
        () => SoldRentalsUseCase(getIt()),
  );

  // Rentals Cubit
  getIt.registerFactory<SoldRentalCubit>(
        () => SoldRentalCubit(getIt()),
  );
}