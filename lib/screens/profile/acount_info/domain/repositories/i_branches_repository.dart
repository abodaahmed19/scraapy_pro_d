import 'package:scraapy_pro/screens/profile/acount_info/domain/entities/branches_entity.dart';

abstract class IBranchesRepository {
  Future<BranchesEntity> getAllBranches();
}
