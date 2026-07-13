import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/screens/market/domain/use_cases/market_use_case.dart';
import 'package:scraapy_pro/screens/market/presentation/cubit/market_state.dart';



class MarketCubit extends Cubit<MarketState> {
  final GetMarketsUseCase getMarketsUseCase;

  MarketCubit(this.getMarketsUseCase) : super(MarketInitial());

  Future<void> getMarket() async {
    emit(MarketLoading());

    try {
      final data = await getMarketsUseCase();
      print(data.first);

      emit(MarketLoaded(data));
    } catch (e) {
      print(e);
      emit(MarketError(e.toString()));
    }
  }
}