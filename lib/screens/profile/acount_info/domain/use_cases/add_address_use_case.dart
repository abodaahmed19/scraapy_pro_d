import 'package:scraapy_pro/screens/profile/acount_info/domain/entities/address_entity.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/repositories/i_branches_repository.dart';

class AddAddressUseCase {
  final IBranchesRepository repository;

  AddAddressUseCase(this.repository);

  Future<void> call(AddressEntity addressEntity) async {
    return await repository.addAddress(addressEntity);
  }
}
