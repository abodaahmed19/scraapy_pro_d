import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/core/error/api_exception.dart';
import 'package:scraapy_pro/screens/manifest/domain/entities/danger_mainfest_model.dart';
import 'package:scraapy_pro/screens/manifest/domain/use_cases/create_danger_mainfest_use_case.dart';
import 'package:scraapy_pro/screens/manifest/presentation/cubit/danger_mainfest_state.dart';

class DangerMainfestCubit extends Cubit<DangerMainfestState> {
  final CreateDangerMainfestUseCase createDangerMainfestUseCase;

  DangerMainfestCubit(this.createDangerMainfestUseCase)
      : super(DangerMainfestInitial());

  Future<void> createDangerMainfest(DangerMainfestModel model) async {
    emit(DangerMainfestLoading());

    try {
      await createDangerMainfestUseCase(model);
      emit(DangerMainfestSuccess());
    } on ApiException catch (e) {
      emit(DangerMainfestError(e.message));
    }
  }
}