import 'package:scraapy_pro/screens/retals/data/repositories/retals_repository.dart';
import 'package:scraapy_pro/screens/retals/domain/entities/retals_item_entity.dart';

class GetRetalsUseCase {
  final RetalsRepository repository;

  GetRetalsUseCase(this.repository);

  Future<List<RetalsItemEntity>> call() async {
    return await repository.getRetals();
  }
}

