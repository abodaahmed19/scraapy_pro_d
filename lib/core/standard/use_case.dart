import 'package:multiple_result/multiple_result.dart';

import '../error/failure.dart';

abstract class UseCase<T, Param> {
  Future<Result<T, Failure>> call(Param param);
}

abstract class UseCaseWithoutParam<T> {
  Future<Result<T, Failure>> call();
}
