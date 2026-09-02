import 'package:scraapy_pro/screens/services/data/repositories/services_repository.dart';
import 'package:scraapy_pro/screens/services/domain/entities/services_entity.dart';

class AddServicesQuotationUseCase {
  final ServicesRepository repository;

  AddServicesQuotationUseCase(this.repository);

  Future<void> call(Map<String,dynamic> data) async {
    return await repository.addQuotation(data);
  }
}

