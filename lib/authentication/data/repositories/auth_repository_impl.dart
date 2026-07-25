import 'package:multiple_result/multiple_result.dart';
import 'package:scraapy_pro/authentication/data/data_sources/auth_data_source.dart';
import 'package:scraapy_pro/authentication/domain/entities/auth_entity.dart';
import 'package:scraapy_pro/authentication/domain/repositories/i_auth_repository.dart';
import 'package:scraapy_pro/core/error/failure.dart';

class AuthRepositoryImpl implements IAuthRepository {
  AuthRepositoryImpl({required this.dataSource});

  final AuthDataSource dataSource;

  @override
  Future<Result<SendOtpResult, Failure>> sendOtp(String identifier) async {
    try {
      final result = await dataSource.sendOtp(identifier);
      return Success(result);
    } on AuthException catch (e) {
      return Error(ServerFailure(e.code.name));
    } catch (e) {
      return Error(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Result<String, Failure>> verifyOtp(
    String identifier,
    String code,
  ) async {
    try {
      final userType = await dataSource.verifyOtp(identifier, code);
      return Success(userType);
    } on AuthException catch (e) {
      return Error(ServerFailure(e.code.name));
    } catch (e) {
      return Error(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Result<void, Failure>> sendVerificationCode(String phone) async {
    try {
      await dataSource.sendVerificationCode(phone);
      return const Success(null);
    } catch (e) {
      return Error(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Result<bool, Failure>> verifyVerificationCode(
    String phone,
    String otp,
  ) async {
    try {
      final ok = await dataSource.verifyVerificationCode(phone, otp);
      return Success(ok);
    } catch (e) {
      return Error(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Result<int, Failure>> register({
    required String name,
    required String email,
    required String phone,
    required String accountType,
    String inviteCode = '',
  }) async {
    try {
      final code = await dataSource.register(
        name: name,
        email: email,
        phone: phone,
        accountType: accountType,
        inviteCode: inviteCode,
      );
      return Success(code);
    } catch (e) {
      return Error(ServerFailure(e.toString()));
    }
  }
}
