import 'package:scraapy_pro/screens/profile/operations/buying/data/repository/buying_rentals_repo.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/domain/entity/buying_entity.dart';

class BuyingRentalsUseCase {
  final BuyingRentalsRepo repository;

  BuyingRentalsUseCase(this.repository);

  Future<buyingOrdersEntity> call(int page) async {
    return await repository.getBuyingRentals(page);
  }
}
