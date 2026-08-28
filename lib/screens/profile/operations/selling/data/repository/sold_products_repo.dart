
import 'package:scraapy_pro/screens/notifications/data/data_source/notifications_data_source.dart';
import 'package:scraapy_pro/screens/notifications/domain/entities/notifications_entity.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/data/remote_data_source/sold_products_ds.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/domain/entity/selling_entity.dart';

abstract class SoldProductsRepo {
  Future <SellingOrdersEntity> getAllSoldProducts(int page);
}

class SoldProductsRepoImpl implements SoldProductsRepo {
  final SoldProductsDs soldProductsDs;

  SoldProductsRepoImpl(this.soldProductsDs);

  @override
  Future <SellingOrdersEntity> getAllSoldProducts(int page) async {
    return await soldProductsDs.getSoldProducts(page);
  }
}
