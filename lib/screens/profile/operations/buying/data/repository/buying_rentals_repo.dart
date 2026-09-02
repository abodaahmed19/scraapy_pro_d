import 'package:scraapy_pro/screens/profile/operations/buying/data/remote_data_source/buying_rentals_ds.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/domain/entity/buying_entity.dart';

abstract class BuyingRentalsRepo {
  Future<buyingOrdersEntity> getBuyingRentals(int page);
}

class BuyingRentalsRepoImpl implements BuyingRentalsRepo {
  final BuyingRentalsDs buyingRentalsDs;

  BuyingRentalsRepoImpl(this.buyingRentalsDs);

  @override
  Future<buyingOrdersEntity> getBuyingRentals(int page) async {
    return await buyingRentalsDs.getBuyingRentals(page);
  }
}
