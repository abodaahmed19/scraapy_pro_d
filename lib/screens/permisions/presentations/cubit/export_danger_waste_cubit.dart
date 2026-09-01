import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/core/error/api_exception.dart';
import 'package:scraapy_pro/screens/permisions/domain/use_cases/exporting_danger_waste_use_case.dart';
import 'package:scraapy_pro/screens/permisions/presentations/cubit/export_danger_waste_state.dart';

class ExportDangerWasteCubit extends Cubit<ExportDangerWasteState> {
  final ExportingDangerWasteUseCase exportingDangerWasteUseCase;

  ExportDangerWasteCubit(this.exportingDangerWasteUseCase)
      : super(ExportDangerWasteInitial());

  Future<void> exportingDangerWaste(Map<String, dynamic> body) async {
    emit(ExportDangerWasteInitial());

    try {
      await exportingDangerWasteUseCase(body);
      emit(ExportDangerWasteSuccess());
    } on ApiException catch (e) {
      emit(ExportDangerWasteError(e.message));
    }
  }
}