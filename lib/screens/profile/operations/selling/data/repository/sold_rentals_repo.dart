import 'package:scraapy_pro/screens/profile/operations/selling/data/remote_data_source/sold_rentals_ds.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/domain/entity/selling_entity.dart';

abstract class SoldRentalsRepo {
  Future<SellingOrdersEntity> getSoldRentals(int page);
}

class SoldRentalsRepoImpl implements SoldRentalsRepo {
  final SoldRentalsDs soldRentalsDs;

  SoldRentalsRepoImpl(this.soldRentalsDs);

  @override
  Future<SellingOrdersEntity> getSoldRentals(int page) async {
    return await soldRentalsDs.getSoldRentals(page);
  }
}
