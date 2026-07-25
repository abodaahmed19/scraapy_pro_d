import 'package:multiple_result/multiple_result.dart';
import 'package:scraapy_pro/authentication/domain/repositories/i_auth_repository.dart';
import 'package:scraapy_pro/core/error/failure.dart';
import 'package:scraapy_pro/core/standard/use_case.dart';

class RegisterUseCase extends UseCase<int, RegisterParams> {
  RegisterUseCase({required this.repository});

  final IAuthRepository repository;

  @override
  Future<Result<int, Failure>> call(RegisterParams param) =>
      repository.register(
        name: param.name,
        email: param.email,
        phone: param.phone,
        accountType: param.accountType,
        inviteCode: param.inviteCode,
      );
}

class RegisterParams {
  const RegisterParams({
    required this.name,
    required this.email,
    required this.phone,
    this.accountType = 'individual',
    this.inviteCode = '',
  });

  final String name;
  final String email;
  final String phone;
  final String accountType;
  final String inviteCode;
}
