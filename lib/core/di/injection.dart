import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:scraapy_pro/screens/market/data/data_source/market_data_source.dart';
import 'package:scraapy_pro/screens/market/data/repositories/market_repository.dart';
import 'package:scraapy_pro/screens/market/domain/use_cases/market_use_case.dart';
import 'package:scraapy_pro/screens/market/presentation/cubit/market_cubit.dart';

import '../../screens/services/data/data_sources/service_data_source.dart';
import '../../screens/services/data/reposetories/service_repository.dart';
import '../../screens/services/doman/use_cases/service_use_case.dart';
import '../../screens/services/presenation/cubit/service_cubit.dart';

final getIt = GetIt.instance;

void setup() {

  // Dio
  getIt.registerLazySingleton<Dio>(() => Dio());
  // DataSource
  getIt.registerLazySingleton<ServiceRemoteDataSource>(
        () => ServiceRemoteDataSourceImpl(getIt()),
  );
  // Repository
  getIt.registerLazySingleton<ServiceRepository>(
        () => ServiceRepositoryImpl(getIt()),
  );
  // UseCase
  getIt.registerLazySingleton(
        () => GetServicesUseCase(getIt()),
  );
  // Cubit
  getIt.registerFactory(
        () => ServiceCubit(getIt()),
  );

  ///MARKET///
  getIt.registerLazySingleton<MarketRemoteDataSource>(
        () => MarketRemoteDataSourceImpl(getIt()),
  );
  // Repository
  getIt.registerLazySingleton<MarketRepository>(
        () => MarketRepositoryImpl(getIt()),
  );
  // UseCase
  getIt.registerLazySingleton(
        () => GetMarketsUseCase(getIt()),
  );
  // Cubit
  getIt.registerFactory(
        () => MarketCubit(getIt()),
  );




}