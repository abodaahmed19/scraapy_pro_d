import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/screens/stock_market/presentation/cubit/stock_market_state.dart';

class StockMarketCubit extends Cubit<StockMarketState> {
  StockMarketCubit()
      : super(StockMarketState(
    status: StockRequestStatus.loading,
    data: [],
    selectedTab: 'معادن',
  ));

  ///  API State
  // Future<void> fetchData() async {
  //   emit(state.copyWith(status: RequestStatus.loading));
  //
  //   try {
  //     final result = await repo.getData();
  //
  //     emit(state.copyWith(
  //       status: RequestStatus.success,
  //       data: result,
  //     ));
  //   } catch (e) {
  //     emit(state.copyWith(
  //       status: RequestStatus.failure,
  //       error: e.toString(),
  //     ));
  //   }
  // }

  void changeTab(String tab) {

    emit(state.copyWith(selectedTab: tab,));
  }
}