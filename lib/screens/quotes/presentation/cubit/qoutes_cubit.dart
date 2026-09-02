import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/screens/quotes/presentation/cubit/qoutes_state.dart';

class QoutesCubit extends Cubit<QoutesState> {
  QoutesCubit()
      : super(QoutesState(

    selectedTab: 'service',
  ));

  /// 🔹 API State
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

  /// 🔹 UI State (NO API CALL)
  void changeTab(String tab) {
    emit(state.copyWith(selectedTab: tab, ));
  }
}