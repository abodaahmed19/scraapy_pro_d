import 'package:dio/dio.dart';
import 'package:scraapy_pro/screens/permisions/data/repository/permissions_repo.dart';

class ImportingNonDangerWasteUseCase {
  final PermissionsRepo repository;

  ImportingNonDangerWasteUseCase(this.repository);

  Future<void> call(FormData body) async {
    return await repository.importingNonDangerWaste(body);
  }
}