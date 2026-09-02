import 'package:scraapy_pro/screens/rentals/data/repositories/retals_repository.dart';
import 'package:scraapy_pro/screens/rentals/domain/entities/rentals_entity.dart';

import '../../../services/domain/entities/services_entity.dart';

class GetRentalsUseCase {
  final RentalsRepository repository;

  GetRentalsUseCase(this.repository);

  Future<ServicesEntity> call() async {
    return await repository.getRentals();
  }
}

