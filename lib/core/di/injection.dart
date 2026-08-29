import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:scraapy_pro/authentication/data/data_sources/auth_data_source.dart';
import 'package:scraapy_pro/authentication/data/data_sources/auth_data_source_impl.dart';
import 'package:scraapy_pro/authentication/data/repositories/auth_repository_impl.dart';
import 'package:scraapy_pro/authentication/domain/repositories/i_auth_repository.dart';
import 'package:scraapy_pro/authentication/domain/use_cases/register_use_case.dart';
import 'package:scraapy_pro/authentication/domain/use_cases/send_otp_use_case.dart';
import 'package:scraapy_pro/authentication/domain/use_cases/send_verification_code_use_case.dart';
import 'package:scraapy_pro/authentication/domain/use_cases/verify_otp_use_case.dart';
import 'package:scraapy_pro/core/config/res/constants_manager.dart';

import 'package:scraapy_pro/core/di/auth_service.dart';
import 'package:scraapy_pro/core/helpers/cache_service.dart';
import 'package:scraapy_pro/core/storage/session_storage_keys.dart';
import 'package:scraapy_pro/screens/favorites/data/favorite_data_source/favorite_data_source.dart';
import 'package:scraapy_pro/screens/favorites/data/repositories/favorite_repository.dart';
import 'package:scraapy_pro/screens/favorites/domain/use_cases/favorite_use_case.dart';
import 'package:scraapy_pro/screens/favorites/presentation/cubit/favorite_cubit.dart';

import 'package:scraapy_pro/screens/market/data/data_source/market_data_source.dart';
import 'package:scraapy_pro/screens/market/data/repositories/market_repository.dart';
import 'package:scraapy_pro/screens/market/domain/use_cases/market_use_case.dart';
import 'package:scraapy_pro/screens/market/presentation/cubit/market_cubit.dart';
import 'package:scraapy_pro/screens/notifications/dependency_injection/notifications_di.dart';
import 'package:scraapy_pro/screens/profile/acount_info/di/my_wallet_di.dart';
import 'package:scraapy_pro/screens/profile/acount_info/di/my_wallet_transactions_di.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/dependency_injection/bought_products_di.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/dependency_injection/buying_orders_di.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/dependency_injection/buying_rentals_di.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/dependency_injection/sold_products_di.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/dependency_injection/solid_rentals_di.dart';
import 'package:scraapy_pro/screens/quotes/presentation/cubit/qoutes_cubit.dart';
import 'package:scraapy_pro/screens/rentals/data/data_source/retals_data_source.dart';
import 'package:scraapy_pro/screens/rentals/data/repositories/retals_repository.dart';
import 'package:scraapy_pro/screens/rentals/domain/use_cases/retals_use_case.dart';
import 'package:scraapy_pro/screens/rentals/presentation/cubit/Retals_cubit.dart';

import 'package:scraapy_pro/screens/services/data/data_source/services_data_source.dart';
import 'package:scraapy_pro/screens/services/data/repositories/services_repository.dart';
import 'package:scraapy_pro/screens/services/domain/use_cases/services_use_case.dart';

import '../../screens/services/presentation/cubit/services_cubit.dart';
import 'package:scraapy_pro/screens/profile/acount_info/data/data_sources/branches_data_source.dart';
import 'package:scraapy_pro/screens/profile/acount_info/data/repositories/branches_repository_impl.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/repositories/i_branches_repository.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/use_cases/get_branches_use_case.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/cubit/branches_cubit.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/cubit/edit_profile_cubit.dart';
import 'package:scraapy_pro/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:scraapy_pro/core/network/network_service.dart';
import 'package:scraapy_pro/core/network/network_service_impl.dart';



final getIt = GetIt.instance;

void setupDio() {

  getIt.registerLazySingleton(() => const FlutterSecureStorage());

  getIt.registerLazySingleton<SecureStorage>(
        () => SecureStorage(getIt<FlutterSecureStorage>()),
  );


  getIt.registerLazySingleton<AuthService>(
        () => AuthService(getIt()),
  );


  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        baseUrl: '${ConstantManager.baseUrl}',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Accept': 'application/json',
          //  ما تحطيش Content-Type هنا
        },
      ),
    );

    print("🟢 REGISTERED DIO HASH: ${dio.hashCode}");

    /// 🔐 Auth Interceptor
    dio.interceptors.add(

      InterceptorsWrapper(
        onRequest: (options, handler) async {

          print("🚀 Interceptor Called");

          final storage = getIt<SecureStorage>();

          final token = await storage.read(SessionStorageKeys.token);

          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'token $token';
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

  ///Branches///
  getIt.registerLazySingleton<BranchesDataSource>(
    () => BranchesDataSourceImp(),
  );
  getIt.registerLazySingleton<IBranchesRepository>(
    () => BranchesRepositoryImpl(getIt<BranchesDataSource>()),
  );
  getIt.registerLazySingleton(
    () => GetBranchesUseCase(getIt<IBranchesRepository>()),
  );
  getIt.registerFactory(
    () => BranchesCubit(getIt<GetBranchesUseCase>()),
  );

  ///EditProfile///
  // Cubit
  getIt.registerFactory(
        () => EditProfileCubit(),
  );

  ///Auth///
  // ── DataSource ────────────────────────────────────────────────────────────
  getIt.registerLazySingleton<AuthDataSource>(
        () => AuthDataSourceImpl(),
  );

  // ── Repository ────────────────────────────────────────────────────────────
  getIt.registerLazySingleton<IAuthRepository>(
        () => AuthRepositoryImpl(dataSource: sl<AuthDataSource>()),
  );

  // ── Use Cases ─────────────────────────────────────────────────────────────
  getIt.registerLazySingleton<SendOtpUseCase>(
        () => SendOtpUseCase(repository: sl<IAuthRepository>()),
  );
  getIt.registerLazySingleton<VerifyOtpUseCase>(
        () => VerifyOtpUseCase(repository: sl<IAuthRepository>()),
  );
  getIt.registerLazySingleton<SendVerificationCodeUseCase>(
        () => SendVerificationCodeUseCase(repository: sl<IAuthRepository>()),
  );
  getIt.registerLazySingleton<VerifyVerificationCodeUseCase>(
        () => VerifyVerificationCodeUseCase(repository: sl<IAuthRepository>()),
  );
  getIt.registerLazySingleton<RegisterUseCase>(
        () => RegisterUseCase(repository: sl<IAuthRepository>()),
  );

  ///Network///
  getIt.registerLazySingleton<NetworkService>(
        () => NetworkServiceImpl(getIt<Dio>()),
  );

  ///User///
  getIt.registerLazySingleton<UserCubit>(
        () => UserCubit(),
  );

  ///Qoutes///
  getIt.registerFactory(
        () => QoutesCubit(),
  );

  ///Notifications///
  setupNotificationsDI();
  ///SoldProducts///
  setupSoldProductsDI();
  ///SoldRentals///
  setupSoldRentalsDI();
  ///BoughtProducts///
  setupBoughtProductsDI();
  ///BuyingOrders///
  setupBuyingOrdersDI();
  ///BuyingRentals///
  setupBuyingRentalsDI();
  ///MyWallet///
  setupMyWalletDI();
  ///MyWalletTransactions///
  setupMyWalletTransactionsDI();

}