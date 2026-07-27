import 'package:multiple_result/multiple_result.dart';
import 'package:scraapy_pro/core/error/failure.dart';
import 'package:scraapy_pro/core/shared/models/user_model.dart';
import 'package:scraapy_pro/core/standard/use_case.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/repositories/i_profile_repository.dart';

class FetchProfileUseCase extends UseCaseWithoutParam<UserModel> {
  FetchProfileUseCase({required this.repository});
  final IProfileRepository repository;

  @override
  Future<Result<UserModel, Failure>> call() =>
      repository.fetchMeAndRefreshCache();
}
