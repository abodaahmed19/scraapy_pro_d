import 'package:get_it/get_it.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/repositories/i_branches_repository.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/use_cases/add_address_use_case.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/cubit/add_branch_cubit.dart';

final getIt = GetIt.instance;

void setupAddAddressDI() {
  // Use Case
  getIt.registerLazySingleton<AddAddressUseCase>(
        () => AddAddressUseCase(getIt<IBranchesRepository>()),
  );

  // Cubit
  getIt.registerFactory<AddBranchCubit>(
        () => AddBranchCubit(getIt<AddAddressUseCase>()),
  );
}
