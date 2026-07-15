import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/screens/rentals/domain/use_cases/retals_use_case.dart';
import 'package:scraapy_pro/screens/rentals/presentation/cubit/Retals_state.dart';


class RentalsCubit extends Cubit<RentalsState> {
  final GetRentalsUseCase getRentalsUseCase;

  RentalsCubit(this.getRentalsUseCase) : super(RentalsInitial());

  Future<void> getRentals() async {
    emit(RentalsLoading());

    try {
      final data = await getRentalsUseCase();
      print(data.first);

      emit(RentalsLoaded(data));
    } catch (e) {
      print(e);
      emit(RentalsError(e.toString()));
    }
  }
}