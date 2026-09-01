import 'package:scraapy_pro/screens/permisions/data/repository/permissions_repo.dart';

class ExportingDangerWasteUseCase {
  final PermissionsRepo repository;

  ExportingDangerWasteUseCase(this.repository);

  Future<void> call(Map<String, dynamic> body) async {
    return await repository.exportingDangerWaste(body);
  }
}