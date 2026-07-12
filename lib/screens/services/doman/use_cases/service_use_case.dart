import 'package:scraapy_pro/screens/services/data/reposetories/service_repository.dart';
import 'package:scraapy_pro/screens/services/doman/entities/service_entity.dart';

class GetServicesUseCase {
  final ServiceRepository repository;

  GetServicesUseCase(this.repository);

  Future<List<ServiceEntity>> call() async {
    return await repository.getServices();
  }
}