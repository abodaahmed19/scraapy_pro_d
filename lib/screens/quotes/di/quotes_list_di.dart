import 'package:get_it/get_it.dart';
import 'package:scraapy_pro/screens/quotes/data/remote_ds/quotes_list_remote_ds.dart';
import 'package:scraapy_pro/screens/quotes/data/repositories/quotes_list_repository.dart';
import 'package:scraapy_pro/screens/quotes/domain/use_cases/quotes_list_use_case.dart';
import 'package:scraapy_pro/screens/quotes/presentation/cubit/quotes_list_cubit.dart';

final getIt = GetIt.instance;

void setupQuotesListDI() {
  // Data Source
  getIt.registerLazySingleton<QuotesListRemoteDs>(
        () => QuotesRemoteDsImpl(getIt()),
  );

  // Repository
  getIt.registerLazySingleton<QuotesListRepository>(
        () => QuotesListRepositoryImpl(getIt()),
  );

  // Use Case
  getIt.registerLazySingleton<GetQuotesListUseCase>(
        () => GetQuotesListUseCase(getIt()),
  );

  // Cubit
  getIt.registerFactory<QuotesListCubit>(
        () => QuotesListCubit(getIt()),
  );
}
