import 'package:multiple_result/multiple_result.dart';
import 'package:scraapy_pro/authentication/domain/entities/auth_entity.dart';
import 'package:scraapy_pro/authentication/domain/repositories/i_auth_repository.dart';
import 'package:scraapy_pro/core/error/failure.dart';
import 'package:scraapy_pro/core/standard/use_case.dart';


class SendOtpUseCase extends UseCase<SendOtpResult, String> {
  SendOtpUseCase({required this.repository});

  final IAuthRepository repository;

  @override
  Future<Result<SendOtpResult, Failure>> call(String param) =>
      repository.sendOtp(param);
}
