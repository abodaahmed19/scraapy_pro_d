import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:scraapy_pro/core/di/auth_service.dart';
import 'package:scraapy_pro/screens/favorites/data/favorite_data_source/favorite_data_source.dart';
import 'package:scraapy_pro/screens/favorites/data/repositories/favorite_repository.dart';
import 'package:scraapy_pro/screens/favorites/domain/use_cases/favorite_use_case.dart';
import 'package:scraapy_pro/screens/favorites/presentation/cubit/favorite_cubit.dart';

import 'package:scraapy_pro/screens/market/data/data_source/market_data_source.dart';
import 'package:scraapy_pro/screens/market/data/repositories/market_repository.dart';
import 'package:scraapy_pro/screens/market/domain/use_cases/market_use_case.dart';
import 'package:scraapy_pro/screens/market/presentation/cubit/market_cubit.dart';
import 'package:scraapy_pro/screens/rentals/data/data_source/retals_data_source.dart';
import 'package:scraapy_pro/screens/rentals/data/repositories/retals_repository.dart';
import 'package:scraapy_pro/screens/rentals/domain/use_cases/retals_use_case.dart';
import 'package:scraapy_pro/screens/rentals/presentation/cubit/Retals_cubit.dart';

import 'package:scraapy_pro/screens/services/data/data_source/services_data_source.dart';
import 'package:scraapy_pro/screens/services/data/repositories/services_repository.dart';
import 'package:scraapy_pro/screens/services/domain/use_cases/services_use_case.dart';

import '../../screens/services/presentation/cubit/services_cubit.dart';



final getIt = GetIt.instance;

void setupDio() {

  getIt.registerLazySingleton(() => const FlutterSecureStorage());

  getIt.registerLazySingleton<AuthService>(
        () => AuthService(getIt()),
  );


  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://your-api.com/api/',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Accept': 'application/json',
          //  ما تحطيش Content-Type هنا
        },
      ),
    );

    /// 🔐 Auth Interceptor
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async{
          // final token = getIt<AuthService>().token;
          final token = await getIt<AuthService>().getToken();

          if (token != null) {
            // options.headers['Authorization'] = 'Bearer $token';
            //TEST//
            options.headers['Authorization'] = 'Token f56a6bba85c52c8669e93560ed56d878de66cc64ccedbd900e53cf29a20df0cb';


          }

          return handler.next(options);
        },
      ),
    );

    /// 🪵 Logging
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );

    return dio;
  });
}

void setup() {

  // Dio
  // getIt.registerLazySingleton<Dio>(() => Dio());

  final getIt = GetIt.instance;

  setupDio();




  ///HOME///
  // getIt.registerLazySingleton<ServiceRemoteDataSource>(
  //       () => ServiceRemoteDataSourceImpl(getIt()),
  // );
  // // Repository
  // getIt.registerLazySingleton<ServiceRepository>(
  //       () => ServiceRepositoryImpl(getIt()),
  // );
  // // UseCase
  // getIt.registerLazySingleton(
  //       () => GetServiceUseCase(getIt()),
  // );
  // // Cubit
  // getIt.registerFactory(
  //       () => ServicesCubit(getIt()),
  // );

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

  ///Services///
  getIt.registerLazySingleton<ServicesRemoteDataSource>(
        () => ServicesRemoteDataSourceImpl(getIt()),
  );
  // Repository
  getIt.registerLazySingleton<ServicesRepository>(
        () => ServicesRepositoryImpl(getIt()),
  );
  // UseCase
  getIt.registerLazySingleton(
        () => GetServicesUseCase(getIt()),
  );
  // Cubit
  getIt.registerFactory(
        () => ServicesCubit(getIt()),
  );

  ///Rental///
  getIt.registerLazySingleton<RentalsRemoteDataSource>(
        () => RentalsRemoteDataSourceImpl(getIt()),
  );
  // Repository
  getIt.registerLazySingleton<RentalsRepository>(
        () => RentalsRepositoryImpl(getIt()),
  );
  // UseCase
  getIt.registerLazySingleton(
        () => GetRentalsUseCase(getIt()),
  );
  // Cubit
  getIt.registerFactory(
        () => RentalsCubit(getIt()),
  );

  ///Favorite///
  getIt.registerLazySingleton<FavoriteRemoteDataSource>(
        () => FavoriteRemoteDataSourceImpl(getIt()),
  );
  // Repository
  getIt.registerLazySingleton<FavoriteRepository>(
        () => FavoriteRepositoryImpl(getIt()),
  );
  // UseCase
  getIt.registerLazySingleton(
        () => GetFavoritesUseCase(getIt()),
  );
  // Cubit
  getIt.registerFactory(
        () => FavoriteCubit(getIt()),
  );





}