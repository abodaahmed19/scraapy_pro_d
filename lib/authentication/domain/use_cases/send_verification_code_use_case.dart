import 'package:multiple_result/multiple_result.dart';
import 'package:scraapy_pro/authentication/domain/repositories/i_auth_repository.dart';
import 'package:scraapy_pro/core/error/failure.dart';
import 'package:scraapy_pro/core/standard/use_case.dart';

class SendVerificationCodeUseCase extends UseCase<void, String> {
  SendVerificationCodeUseCase({required this.repository});

  final IAuthRepository repository;

  @override
  Future<Result<void, Failure>> call(String phone) =>
      repository.sendVerificationCode(phone);
}

class VerifyVerificationCodeUseCase
    extends UseCase<bool, VerifyVerificationCodeParams> {
  VerifyVerificationCodeUseCase({required this.repository});

  final IAuthRepository repository;

  @override
  Future<Result<bool, Failure>> call(VerifyVerificationCodeParams param) =>
      repository.verifyVerificationCode(param.phone, param.otp);
}

class VerifyVerificationCodeParams {
  const VerifyVerificationCodeParams({required this.phone, required this.otp});
  final String phone;
  final String otp;
}
