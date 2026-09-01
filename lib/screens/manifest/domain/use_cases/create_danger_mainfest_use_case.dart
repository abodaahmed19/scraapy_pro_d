import 'package:scraapy_pro/screens/manifest/data/repositories/mainfest_repo.dart';
import 'package:scraapy_pro/screens/manifest/domain/entities/danger_mainfest_model.dart';

class CreateDangerMainfestUseCase {
  final MainfestRepo repository;

  CreateDangerMainfestUseCase(this.repository);

  Future<void> call(DangerMainfestModel model) async {
    return await repository.createDangerMainfest(model);
  }
}