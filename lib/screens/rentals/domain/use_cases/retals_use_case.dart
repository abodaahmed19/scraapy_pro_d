import 'package:scraapy_pro/screens/rentals/data/repositories/retals_repository.dart';
import 'package:scraapy_pro/screens/rentals/domain/entities/retals_item_entity.dart';

class GetRentalsUseCase {
  final RentalsRepository repository;

  GetRentalsUseCase(this.repository);

  Future<List<RentalsItemEntity>> call() async {
    return await repository.getRetals();
  }
}

