import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/core/error/api_exception.dart';
import 'package:scraapy_pro/screens/manifest/domain/entities/danger_mainfest_model.dart';
import 'package:scraapy_pro/screens/manifest/domain/use_cases/create_mainfest_use_case.dart';
import 'package:scraapy_pro/screens/manifest/presentation/cubit/mainfest_state.dart';

class MainfestCubit extends Cubit<MainfestState> {
  final CreateMainfestUseCase addMainfestUseCase;

  MainfestCubit(this.addMainfestUseCase) : super(MainfestInitial());

  Future<void> createMainfest(DangerMainfestModel model) async {
    emit(MainfestLoading());

    try {
      await addMainfestUseCase(model);
      emit(MainfestSuccess());
    } on ApiException catch (e) {
      emit(MainfestError(e.message));
    }
  }
}