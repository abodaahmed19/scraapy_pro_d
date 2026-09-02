import 'package:get_it/get_it.dart';

import 'package:scraapy_pro/screens/services/domain/use_cases/add_quotation_use_case.dart';
import 'package:scraapy_pro/screens/services/presentation/cubit/add_quotation_cubit.dart';
import 'package:scraapy_pro/screens/shared_feature/product_item_card/domain/use_case/add_quotation_use_case.dart';
import 'package:scraapy_pro/screens/shared_feature/product_item_card/presentation/cubit/add_quotation_cubit.dart';

final getIt = GetIt.instance;

void setupQuotationDI() {


  // Use Case
  getIt.registerLazySingleton<AddServicesQuotationUseCase>(
        () => AddServicesQuotationUseCase(getIt()),
  );

  getIt.registerFactory<AddQuotationCubit>(
        () => AddQuotationCubit(getIt()),
  );
}