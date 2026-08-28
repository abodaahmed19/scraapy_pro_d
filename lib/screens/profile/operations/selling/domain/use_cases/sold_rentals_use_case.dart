import 'package:scraapy_pro/screens/profile/operations/selling/data/repository/sold_rentals_repo.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/domain/entity/selling_entity.dart';

class SoldRentalsUseCase {
  final SoldRentalsRepo repository;

  SoldRentalsUseCase(this.repository);

  Future<SellingOrdersEntity> call(int page) async {
    return await repository.getSoldRentals(page);
  }
}
