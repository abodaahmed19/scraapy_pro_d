import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(NavigationState(0));

  int currentIndex = 0;

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NavigationState(currentIndex));
  }
}
