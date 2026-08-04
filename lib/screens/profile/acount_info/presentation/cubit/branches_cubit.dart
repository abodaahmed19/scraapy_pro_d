import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/use_cases/get_branches_use_case.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/cubit/branches_state.dart';

class BranchesCubit extends Cubit<BranchesState> {
  final GetBranchesUseCase getBranchesUseCase;

  BranchesCubit(this.getBranchesUseCase) : super(BranchesInitial());

  Future<void> getBranches() async {
    emit(BranchesLoading());

    try {
      final response = await getBranchesUseCase();
      emit(BranchesLoaded(response));
    } catch (e) {
      emit(BranchesError(e.toString()));
    }
  }
}
