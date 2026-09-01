import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/core/error/api_exception.dart';
import 'package:scraapy_pro/screens/permisions/domain/use_cases/import_danger_waste_permission_use_case.dart';
import 'package:scraapy_pro/screens/permisions/presentations/cubit/import_danger_waste_state.dart';

class ImportDangerWastePermissionsCubit extends Cubit<ImportDangerWastePermissionsState> {
  final ImportingDangerWasteUseCase importingDangerWasteUseCase ;

  ImportDangerWastePermissionsCubit(this.importingDangerWasteUseCase) : super(ImportDangerWasteInitial());

  Future<void> importingDangerWaste(FormData body) async {
    emit(ImportDangerWasteLoading());

    try {
      await importingDangerWasteUseCase(body);
      emit(ImportDangerWasteSuccess());
    } on ApiException catch (e) {

      emit(ImportDangerWasteError(e.message));
    }
  }
}