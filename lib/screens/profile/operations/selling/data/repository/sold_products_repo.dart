
import 'package:scraapy_pro/screens/notifications/data/data_source/notifications_data_source.dart';
import 'package:scraapy_pro/screens/notifications/domain/entities/notifications_entity.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/domain/entity/buying_entity.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/data/remote_data_source/sold_products_ds.dart';

abstract class SoldProductsRepo {
  Future <SellingOrdersEntity> getAllSoldProducts();
}

class SoldProductsRepoImpl implements SoldProductsRepo {
  final SoldProductsDs soldProductsDs;

  SoldProductsRepoImpl(this.soldProductsDs);

  @override
  Future <SellingOrdersEntity> getAllSoldProducts() async {
    return await soldProductsDs.getSoldProducts();
  }
}
