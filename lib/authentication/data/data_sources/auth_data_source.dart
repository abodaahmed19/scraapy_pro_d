
import 'package:scraapy_pro/authentication/domain/entities/auth_entity.dart';

abstract class AuthDataSource {
  Future<SendOtpResult> sendOtp(String identifier);
  Future<String> verifyOtp(String identifier, String code);
  Future<void> sendVerificationCode(String phone);
  Future<bool> verifyVerificationCode(String phone, String otp);
  Future<int> register({
    required String name,
    required String email,
    required String phone,
    required String accountType,
    String inviteCode,
  });
}
