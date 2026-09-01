import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/core/error/api_exception.dart';
import 'package:scraapy_pro/screens/permisions/domain/use_cases/importing_non_danger_waste_use_case.dart';
import 'package:scraapy_pro/screens/permisions/presentations/cubit/import_danger_non_waste_permissions_state.dart';

class ImportDangerNonWastePermissionsCubit
    extends Cubit<ImportDangerNonWastePermissionsState> {
  final ImportingNonDangerWasteUseCase importingNonDangerWasteUseCase;

  ImportDangerNonWastePermissionsCubit(this.importingNonDangerWasteUseCase)
      : super(ImportDangerNonWasteInitial());

  Future<void> importingNonDangerWaste(Map<String, dynamic> body) async {
    emit(ImportDangerNonWasteInitial());

    try {
      await importingNonDangerWasteUseCase(body);
      emit(ImportDangerNonWasteSuccess());
    } on ApiException catch (e) {
      emit(ImportDangerNonWasteError(e.message));
    }
  }
}