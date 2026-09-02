import 'package:scraapy_pro/screens/profile/operations/buying/data/remote_data_source/bought_products_ds.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/domain/entity/buying_entity.dart';

abstract class BoughtProductsRepo {
  Future<buyingOrdersEntity> getBoughtProducts(int page);
}

class BoughtProductsRepoImpl implements BoughtProductsRepo {
  final BoughtProductsDs boughtProductsDs;

  BoughtProductsRepoImpl(this.boughtProductsDs);

  @override
  Future<buyingOrdersEntity> getBoughtProducts(int page) async {
    return await boughtProductsDs.getBoughtProducts(page);
  }
}
