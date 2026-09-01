import 'package:scraapy_pro/screens/profile/acount_info/domain/entities/address_entity.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/entities/branches_entity.dart';

abstract class IBranchesRepository {
  Future<BranchesEntity> getAllBranches();
  Future<void> addAddress(AddressEntity addressEntity);
}
