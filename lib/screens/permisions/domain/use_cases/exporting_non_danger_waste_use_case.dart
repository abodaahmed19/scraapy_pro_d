import 'package:dio/dio.dart';
import 'package:scraapy_pro/screens/permisions/data/repository/permissions_repo.dart';

class ExportingNonDangerWasteUseCase {
  final PermissionsRepo repository;

  ExportingNonDangerWasteUseCase(this.repository);

  Future<void> call(FormData body) async {
    return await repository.exportingNonDangerWaste(body);
  }
}