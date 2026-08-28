
import 'package:scraapy_pro/screens/profile/operations/selling/data/repository/sold_products_repo.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/domain/entity/selling_entity.dart';

class SoldProductsUseCase {
  final SoldProductsRepo repository;

  SoldProductsUseCase(this.repository);

  Future<SellingOrdersEntity> call(int page) async {
    return await repository.getAllSoldProducts(page);
  }
}

