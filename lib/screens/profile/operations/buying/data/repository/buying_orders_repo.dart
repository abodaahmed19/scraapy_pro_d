import 'package:scraapy_pro/screens/profile/operations/buying/data/remote_data_source/buying_orders_ds.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/domain/entity/buying_entity.dart';

abstract class BuyingOrdersRepo {
  Future<buyingOrdersEntity> getBuyingOrders(int page);
}

class BuyingOrdersRepoImpl implements BuyingOrdersRepo {
  final BuyingOrdersDs buyingOrdersDs;

  BuyingOrdersRepoImpl(this.buyingOrdersDs);

  @override
  Future<buyingOrdersEntity> getBuyingOrders(int page) async {
    return await buyingOrdersDs.getBuyingOrders(page);
  }
}
