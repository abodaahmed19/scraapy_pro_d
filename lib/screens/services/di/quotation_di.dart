// import 'package:get_it/get_it.dart';
//
// import 'package:scraapy_pro/screens/services/domain/use_cases/add_quotation_use_case.dart';
// import 'package:scraapy_pro/screens/services/presentation/cubit/add_quotation_cubit.dart';
//
// final getIt = GetIt.instance;
//
// void setupQuotationDI() {
//
//
//   // Use Case
//   getIt.registerLazySingleton<AddServicesQuotationUseCase>(
//         () => AddServicesQuotationUseCase(getIt()),
//   );
//
//   getIt.registerFactory<AddQuotationCubit>(
//         () => AddQuotationCubit(getIt()),
//   );
// }