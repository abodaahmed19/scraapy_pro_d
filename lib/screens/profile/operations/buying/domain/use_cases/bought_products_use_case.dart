import 'package:scraapy_pro/screens/profile/operations/buying/data/repository/bought_products_repo.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/domain/entity/buying_entity.dart';

class BoughtProductsUseCase {
  final BoughtProductsRepo repository;

  BoughtProductsUseCase(this.repository);

  Future<buyingOrdersEntity> call(int page) async {
    return await repository.getBoughtProducts(page);
  }
}
