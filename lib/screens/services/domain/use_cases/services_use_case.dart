import 'package:scraapy_pro/screens/services/data/repositories/services_repository.dart';
import 'package:scraapy_pro/screens/services/domain/entities/services_item_entity.dart';

class GetServicesUseCase {
  final ServicesRepository repository;

  GetServicesUseCase(this.repository);

  Future<List<ServicesItemEntity>> call() async {
    return await repository.getServices();
  }
}

