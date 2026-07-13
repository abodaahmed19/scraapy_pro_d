import 'package:scraapy_pro/screens/home/data/service_repositiry.dart';
import 'package:scraapy_pro/screens/home/domain/entities/service_entity.dart';

class GetServiceUseCase {
  final ServiceRepository repository;

  GetServiceUseCase(this.repository);

  Future<ServiceResponseModel> call(String type) async {
    return await repository.getServices(type);
  }
}

