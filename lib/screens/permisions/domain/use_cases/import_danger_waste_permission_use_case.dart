import 'package:scraapy_pro/screens/permisions/data/repository/permissions_repo.dart';

class ImportingDangerWasteUseCase {
  final PermissionsRepo repository;

  ImportingDangerWasteUseCase(this.repository);

  Future<void> call(Map<String, dynamic> body) async {
    return await repository.importingDangerWaste(body);
  }
}