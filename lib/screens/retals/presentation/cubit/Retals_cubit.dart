import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/screens/retals/domain/use_cases/retals_use_case.dart';
import 'package:scraapy_pro/screens/retals/presentation/cubit/Retals_state.dart';



class RetalsCubit extends Cubit<RetalsState> {
  final GetRetalsUseCase getRetalsUseCase;

  RetalsCubit(this.getRetalsUseCase) : super(RetalsInitial());

  Future<void> getRetals() async {
    emit(RetalsLoading());

    try {
      final data = await getRetalsUseCase();
      print(data.first);

      emit(RetalsLoaded(data));
    } catch (e) {
      print(e);
      emit(RetalsError(e.toString()));
    }
  }
}