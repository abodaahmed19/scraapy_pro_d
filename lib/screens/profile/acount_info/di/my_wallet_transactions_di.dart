import 'package:get_it/get_it.dart';
import 'package:scraapy_pro/screens/profile/acount_info/data/data_sources/my_wallet_transactions_ds.dart';
import 'package:scraapy_pro/screens/profile/acount_info/data/repositories/my_wallet_transactions_repo.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/use_cases/my_wallet_transactions_use_case.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/cubit/my_wallet_transactions_cubit.dart';

final getIt = GetIt.instance;

void setupMyWalletTransactionsDI() {
  // Data Source
  getIt.registerLazySingleton<MyWalletTransactionsDs>(
        () => MyWalletTransactionsDsImpl(),
  );

  // Repository
  getIt.registerLazySingleton<MyWalletTransactionsRepo>(
        () => MyWalletTransactionsRepoImpl(getIt()),
  );

  // Use Case
  getIt.registerLazySingleton<MyWalletTransactionsUseCase>(
        () => MyWalletTransactionsUseCase(getIt()),
  );

  // Cubit
  getIt.registerFactory<MyWalletTransactionsCubit>(
        () => MyWalletTransactionsCubit(getIt()),
  );
}
