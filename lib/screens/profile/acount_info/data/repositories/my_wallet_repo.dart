
import 'package:scraapy_pro/screens/notifications/data/data_source/notifications_data_source.dart';
import 'package:scraapy_pro/screens/notifications/domain/entities/notifications_entity.dart';
import 'package:scraapy_pro/screens/profile/acount_info/data/data_sources/my_wallet_ds.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/entities/my_wallet_entity.dart';

abstract class MyWalletRepo {
  Future <MyWalletEntity> getMyWalletData();
}

class MyWalletRepoImpl implements MyWalletRepo {
  final MyWalletDs myWalletDs;

  MyWalletRepoImpl(this.myWalletDs);

  @override
  Future <MyWalletEntity> getMyWalletData() async {
    return await myWalletDs.getMyWalletData();
  }
}
