import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/core/error/api_exception.dart';
import 'package:scraapy_pro/screens/permisions/domain/use_cases/exporting_non_danger_waste_use_case.dart';
import 'package:scraapy_pro/screens/permisions/presentations/cubit/export_non_danger_waste_state.dart';

class ExportNonDangerWasteCubit extends Cubit<ExportNonDangerWasteState> {
  final ExportingNonDangerWasteUseCase exportingNonDangerWasteUseCase;

  ExportNonDangerWasteCubit(this.exportingNonDangerWasteUseCase)
      : super(ExportNonDangerWasteInitial());

  Future<void> exportingNonDangerWaste(Map<String, dynamic> body) async {
    emit(ExportNonDangerWasteInitial());

    try {
      await exportingNonDangerWasteUseCase(body);
      emit(ExportNonDangerWasteSuccess());
    } on ApiException catch (e) {
      emit(ExportNonDangerWasteError(e.message));
    }
  }
}