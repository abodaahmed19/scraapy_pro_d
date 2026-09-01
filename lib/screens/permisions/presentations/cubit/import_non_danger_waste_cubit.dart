import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/core/error/api_exception.dart';
import 'package:scraapy_pro/screens/permisions/domain/use_cases/importing_non_danger_waste_use_case.dart';
import 'package:scraapy_pro/screens/permisions/presentations/cubit/import_non_danger_waste_state.dart';

class ImportNonDangerWasteCubit
    extends Cubit<ImportNonDangerWasteState> {
  final ImportingNonDangerWasteUseCase importingNonDangerWasteUseCase;

  ImportNonDangerWasteCubit(this.importingNonDangerWasteUseCase)
      : super(ImportDangerNonWasteInitial());

  Future<void> importingNonDangerWaste(FormData body) async {
    emit(ImportDangerNonWasteLoading());

    try {
      await importingNonDangerWasteUseCase(body);
      emit(ImportDangerNonWasteSuccess());
    } on ApiException catch (e) {
      emit(ImportDangerNonWasteError(e.message));
    }
  }
}