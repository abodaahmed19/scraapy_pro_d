// import 'package:scraapypro/src/config/res/constants_manager.dart';
// import 'package:scraapypro/src/features/auth/data/data_sources/auth_data_source.dart';
// import 'package:scraapypro/src/features/auth/data/data_sources/auth_data_source_impl.dart';
// import 'package:scraapypro/src/features/auth/data/repositories/auth_repository_impl.dart';
// import 'package:scraapypro/src/features/auth/domain/repositories/i_auth_repository.dart';
// import 'package:scraapypro/src/features/auth/domain/use_cases/register_use_case.dart';
// import 'package:scraapypro/src/features/auth/domain/use_cases/send_otp_use_case.dart';
// import 'package:scraapypro/src/features/auth/domain/use_cases/send_verification_code_use_case.dart';
// import 'package:scraapypro/src/features/auth/domain/use_cases/verify_otp_use_case.dart';
//
// void setUpAuthDependencies() {
//   // ── DataSource ────────────────────────────────────────────────────────────
//   sl.registerLazySingleton<AuthDataSource>(
//     () => AuthDataSourceImpl(),
//   );
//
//   // ── Repository ────────────────────────────────────────────────────────────
//   sl.registerLazySingleton<IAuthRepository>(
//     () => AuthRepositoryImpl(dataSource: sl<AuthDataSource>()),
//   );
//
//   // ── Use Cases ─────────────────────────────────────────────────────────────
//   sl.registerLazySingleton<SendOtpUseCase>(
//     () => SendOtpUseCase(repository: sl<IAuthRepository>()),
//   );
//   sl.registerLazySingleton<VerifyOtpUseCase>(
//     () => VerifyOtpUseCase(repository: sl<IAuthRepository>()),
//   );
//   sl.registerLazySingleton<SendVerificationCodeUseCase>(
//     () => SendVerificationCodeUseCase(repository: sl<IAuthRepository>()),
//   );
//   sl.registerLazySingleton<VerifyVerificationCodeUseCase>(
//     () => VerifyVerificationCodeUseCase(repository: sl<IAuthRepository>()),
//   );
//   sl.registerLazySingleton<RegisterUseCase>(
//     () => RegisterUseCase(repository: sl<IAuthRepository>()),
//   );
//
// }
