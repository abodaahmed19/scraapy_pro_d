import 'package:multiple_result/multiple_result.dart';
import 'package:scraapy_pro/authentication/domain/repositories/i_auth_repository.dart';
import 'package:scraapy_pro/core/error/failure.dart';
import 'package:scraapy_pro/core/standard/use_case.dart';

class VerifyOtpUseCase extends UseCase<String, VerifyOtpParams> {
  VerifyOtpUseCase({required this.repository});

  final IAuthRepository repository;

  @override
  Future<Result<String, Failure>> call(VerifyOtpParams param) =>
      repository.verifyOtp(param.identifier, param.code);
}

class VerifyOtpParams {
  const VerifyOtpParams({required this.identifier, required this.code});
  final String identifier;
  final String code;
}
