import 'package:scraapy_pro/screens/profile/acount_info/domain/entities/branches_entity.dart';

abstract class BranchesState {}

class BranchesInitial extends BranchesState {}

class BranchesLoading extends BranchesState {}

class BranchesLoaded extends BranchesState {
  final BranchesEntity branches;
  BranchesLoaded(this.branches);
}

class BranchesError extends BranchesState {
  final String message;
  BranchesError(this.message);
}
