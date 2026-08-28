
import 'package:scraapy_pro/screens/profile/operations/buying/domain/entity/buying_entity.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/data/repository/sold_products_repo.dart';

class SoldProductsUseCase {
  final SoldProductsRepo repository;

  SoldProductsUseCase(this.repository);

  Future<SellingOrdersEntity> call() async {
    return await repository.getAllSoldProducts();
  }
}

