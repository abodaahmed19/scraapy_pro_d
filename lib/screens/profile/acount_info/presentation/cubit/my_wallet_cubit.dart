import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/core/error/api_exception.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/use_cases/fetch_profile_use_case.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/use_cases/my_wallet_use_case.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/cubit/my_wallet_state.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/cubit/profile_state.dart';

class MyWalletCubit extends Cubit<MyWalletState> {
  final MyWalletUseCase myWalletUseCase;

  MyWalletCubit(this.myWalletUseCase) : super(MyWalletInitial());


  Future<void> getMyWalletData() async {
    emit(MyWalletLoading());

    try {
      final response = await myWalletUseCase();
      emit(MyWalletLoaded(response));
    } on ApiException catch (e) {
      emit(MyWalletError(e.message));
    }
  }


}
