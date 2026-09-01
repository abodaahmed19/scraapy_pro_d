import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/core/error/api_exception.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/entities/address_entity.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/use_cases/add_address_use_case.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/cubit/add_branch_state.dart';

class AddBranchCubit extends Cubit<AddBranchesState> {
  final AddAddressUseCase addAddressUseCase;

  AddBranchCubit(this.addAddressUseCase) : super(AddBranchesInitial());

  Future<void> addBranch(AddressEntity addressEntity) async {
    emit(AddBranchesLoading());

    try {
      final response = await addAddressUseCase(addressEntity);
      emit(AddBranchesSuccess());
    } on ApiException catch (e) {
      emit(AddBranchesError(e.message));
    }
  }

}
