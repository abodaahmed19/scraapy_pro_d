import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/screens/favorites/domain/use_cases/favorite_use_case.dart';
import 'package:scraapy_pro/screens/favorites/presentation/cubit/favorite_state.dart';
import 'package:scraapy_pro/screens/market/presentation/cubit/market_state.dart';



class FavoriteCubit extends Cubit<FavoriteState> {
  final GetFavoritesUseCase getFavoritesUseCase;

  FavoriteCubit(this.getFavoritesUseCase) : super(FavoriteInitial());

  Future<void> getFavorites() async {
    emit(FavoriteLoading());

    try {
      final data = await getFavoritesUseCase();
      print(data.first);

      emit(FavoriteLoaded(data));
    } catch (e) {
      print(e);
      emit(FavoriteError(e.toString()));
    }
  }
}