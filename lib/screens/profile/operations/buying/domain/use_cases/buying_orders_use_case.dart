import 'package:scraapy_pro/screens/profile/operations/buying/data/repository/buying_orders_repo.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/domain/entity/buying_entity.dart';

class BuyingOrdersUseCase {
  final BuyingOrdersRepo repository;

  BuyingOrdersUseCase(this.repository);

  Future<buyingOrdersEntity> call(int page) async {
    return await repository.getBuyingOrders(page);
  }
}
