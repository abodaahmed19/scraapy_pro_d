import 'package:get_it/get_it.dart';
import 'package:scraapy_pro/screens/manifest/data/remote_data_source/mainfest_ds.dart';
import 'package:scraapy_pro/screens/manifest/data/repositories/mainfest_repo.dart';
import 'package:scraapy_pro/screens/manifest/domain/use_cases/create_mainfest_use_case.dart';
import 'package:scraapy_pro/screens/manifest/domain/use_cases/create_danger_mainfest_use_case.dart';
import 'package:scraapy_pro/screens/manifest/presentation/cubit/danger_mainfest_cubit.dart';
import 'package:scraapy_pro/screens/manifest/presentation/cubit/mainfest_cubit.dart';

final getIt = GetIt.instance;

void setupMainfestDI() {
  // Data Source
  getIt.registerLazySingleton<MainfestDs>(
        () => MainfestDsImpl(getIt()),
  );

  // Repository
  getIt.registerLazySingleton<MainfestRepo>(
        () => MainfestRepoImpl(getIt()),
  );

  // Use Case
  getIt.registerLazySingleton<CreateMainfestUseCase>(
        () => CreateMainfestUseCase(getIt()),
  );

  getIt.registerLazySingleton<CreateDangerMainfestUseCase>(
        () => CreateDangerMainfestUseCase(getIt()),
  );

  // Cubit
  getIt.registerFactory<MainfestCubit>(
        () => MainfestCubit(getIt()),
  );

  getIt.registerFactory<DangerMainfestCubit>(
        () => DangerMainfestCubit(getIt()),
  );
}