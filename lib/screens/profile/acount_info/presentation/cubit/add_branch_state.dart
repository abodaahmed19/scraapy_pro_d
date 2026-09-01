import 'package:scraapy_pro/screens/profile/acount_info/domain/entities/branches_entity.dart';

abstract class AddBranchesState {}

class AddBranchesInitial extends AddBranchesState {}

class AddBranchesLoading extends AddBranchesState {}

class AddBranchesSuccess extends AddBranchesState {
  AddBranchesSuccess();
}

class AddBranchesError extends AddBranchesState {
  final String message;
  AddBranchesError(this.message);
}
