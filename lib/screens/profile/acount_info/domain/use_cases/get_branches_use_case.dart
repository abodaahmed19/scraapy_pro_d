import 'package:scraapy_pro/screens/profile/acount_info/domain/entities/branches_entity.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/repositories/i_branches_repository.dart';

class GetBranchesUseCase {
  final IBranchesRepository repository;

  GetBranchesUseCase(this.repository);

  Future<BranchesEntity> call() async {
    return await repository.getAllBranches();
  }
}
