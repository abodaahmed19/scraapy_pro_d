import 'package:scraapy_pro/screens/permisions/data/repository/permissions_repo.dart';

class ExportingNonDangerWasteUseCase {
  final PermissionsRepo repository;

  ExportingNonDangerWasteUseCase(this.repository);

  Future<void> call(Map<String, dynamic> body) async {
    return await repository.exportingNonDangerWaste(body);
  }
}