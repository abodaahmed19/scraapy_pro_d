import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/use_cases/fetch_profile_use_case.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.fetchProfileUseCase}) : super(ProfileInitial());

  final FetchProfileUseCase fetchProfileUseCase;

  Future<void> fetchMeAndRefreshCache() async {
    emit(ProfileLoading());
    final result = await fetchProfileUseCase();
    result.when(
      (user) => emit(ProfileLoaded(user)),
      (failure) => emit(ProfileError(failure.message)),
    );
  }
}
