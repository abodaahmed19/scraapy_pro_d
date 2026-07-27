import 'package:multiple_result/multiple_result.dart';
import 'package:scraapy_pro/core/error/failure.dart';
import 'package:scraapy_pro/core/shared/models/user_model.dart';

abstract class IProfileRepository {
  Future<Result<UserModel, Failure>> fetchMeAndRefreshCache();
}
