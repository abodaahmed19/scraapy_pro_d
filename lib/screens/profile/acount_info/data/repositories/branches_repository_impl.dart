import 'package:scraapy_pro/screens/profile/acount_info/data/data_sources/branches_data_source.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/entities/address_entity.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/entities/branches_entity.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/repositories/i_branches_repository.dart';

class BranchesRepositoryImpl implements IBranchesRepository {
  final BranchesDataSource dataSource;

  BranchesRepositoryImpl(this.dataSource);

  @override
  Future<BranchesEntity> getAllBranches() async {
    return await dataSource.getAllBranches();
  }

  @override
  Future<void> addAddress(AddressEntity addressEntity) async{
    return await dataSource.addAddress(addressEntity);

  }
}
