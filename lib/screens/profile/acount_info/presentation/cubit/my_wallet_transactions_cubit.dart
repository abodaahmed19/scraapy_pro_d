import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/core/error/api_exception.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/use_cases/my_wallet_transactions_use_case.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/cubit/my_wallet_transactions_state.dart';

class MyWalletTransactionsCubit extends Cubit<MyWalletTransactionsState> {
  final MyWalletTransactionsUseCase myWalletTransactionsUseCase;

  MyWalletTransactionsCubit(this.myWalletTransactionsUseCase)
      : super(MyWalletTransactionsInitial());

  Future<void> getMyWalletTransactions() async {
    emit(MyWalletTransactionsLoading());

    try {
      final response = await myWalletTransactionsUseCase();
      emit(MyWalletTransactionsLoaded(response));
    } on ApiException catch (e) {
      emit(MyWalletTransactionsError(e.message));
    }
  }
}
