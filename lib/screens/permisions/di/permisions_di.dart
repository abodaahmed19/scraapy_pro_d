import 'package:get_it/get_it.dart';
import 'package:scraapy_pro/screens/permisions/data/remote_ds/permisions_ds.dart';
import 'package:scraapy_pro/screens/permisions/data/repository/permissions_repo.dart';
import 'package:scraapy_pro/screens/permisions/domain/use_cases/exporting_danger_waste_use_case.dart';
import 'package:scraapy_pro/screens/permisions/domain/use_cases/exporting_non_danger_waste_use_case.dart';
import 'package:scraapy_pro/screens/permisions/domain/use_cases/import_danger_waste_permission_use_case.dart';
import 'package:scraapy_pro/screens/permisions/domain/use_cases/importing_non_danger_waste_use_case.dart';
import 'package:scraapy_pro/screens/permisions/presentations/cubit/export_danger_waste_cubit.dart';
import 'package:scraapy_pro/screens/permisions/presentations/cubit/export_non_danger_waste_cubit.dart';
import 'package:scraapy_pro/screens/permisions/presentations/cubit/import_danger_non_waste_permissions_cubit.dart';
import 'package:scraapy_pro/screens/permisions/presentations/cubit/import_danger_waste_cubit.dart';

final getIt = GetIt.instance;

void setupPermisionsDI() {
  // Data Source
  getIt.registerLazySingleton<PermisionsDs>(
        () => PermisionsDsImpl(getIt()),
  );

  // Repository
  getIt.registerLazySingleton<PermissionsRepo>(
        () => PermissionsRepoImpl(getIt()),
  );

  // Use Case
  getIt.registerLazySingleton<ImportingDangerWasteUseCase>(
        () => ImportingDangerWasteUseCase(getIt()),
  );

  getIt.registerLazySingleton<ImportingNonDangerWasteUseCase>(
        () => ImportingNonDangerWasteUseCase(getIt()),
  );

  getIt.registerLazySingleton<ExportingDangerWasteUseCase>(
        () => ExportingDangerWasteUseCase(getIt()),
  );

  getIt.registerLazySingleton<ExportingNonDangerWasteUseCase>(
        () => ExportingNonDangerWasteUseCase(getIt()),
  );

  // Cubit
  getIt.registerFactory<ImportDangerWastePermissionsCubit>(
        () => ImportDangerWastePermissionsCubit(getIt()),
  );

  getIt.registerFactory<ImportDangerNonWastePermissionsCubit>(
        () => ImportDangerNonWastePermissionsCubit(getIt()),
  );

  getIt.registerFactory<ExportDangerWasteCubit>(
        () => ExportDangerWasteCubit(getIt()),
  );

  getIt.registerFactory<ExportNonDangerWasteCubit>(
        () => ExportNonDangerWasteCubit(getIt()),
  );
}