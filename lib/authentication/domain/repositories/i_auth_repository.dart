import 'package:multiple_result/multiple_result.dart';
import 'package:scraapy_pro/authentication/domain/entities/auth_entity.dart';
import 'package:scraapy_pro/core/error/failure.dart';

abstract class IAuthRepository {
  /// Send OTP to [identifier] (phone: +966XXXXXXXXX, or email).
  Future<Result<SendOtpResult, Failure>> sendOtp(String identifier);

  /// Verify OTP and complete login. Returns `userType` on success.
  Future<Result<String, Failure>> verifyOtp(String identifier, String code);

  /// Send phone verification code during registration.
  Future<Result<void, Failure>> sendVerificationCode(String phone);

  /// Verify phone OTP during registration. Returns true on success.
  Future<Result<bool, Failure>> verifyVerificationCode(String phone, String otp);

  /// Register a new user. Returns HTTP status code.
  Future<Result<int, Failure>> register({
    required String name,
    required String email,
    required String phone,
    required String accountType,
    String inviteCode,
  });
}
