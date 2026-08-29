
import 'package:scraapy_pro/screens/notifications/data/repositories/notifications_repository.dart';
import 'package:scraapy_pro/screens/notifications/domain/entities/notifications_entity.dart';
import 'package:scraapy_pro/screens/profile/acount_info/data/repositories/my_wallet_repo.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/entities/my_wallet_entity.dart';

class MyWalletUseCase {
  final MyWalletRepo repository;

  MyWalletUseCase(this.repository);

  Future<MyWalletEntity> call() async {
    return await repository.getMyWalletData();
  }
}

