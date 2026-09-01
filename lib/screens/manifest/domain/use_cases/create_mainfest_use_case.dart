import 'package:scraapy_pro/screens/manifest/data/repositories/mainfest_repo.dart';
import 'package:scraapy_pro/screens/manifest/domain/entities/danger_mainfest_model.dart';

class CreateMainfestUseCase {
  final MainfestRepo repository;

  CreateMainfestUseCase(this.repository);

  Future<void> call(DangerMainfestModel model) async {
    return await repository.createMainfest(model);
  }
}