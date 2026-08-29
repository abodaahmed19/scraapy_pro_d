
import 'package:scraapy_pro/screens/profile/acount_info/domain/entities/my_wallet_entity.dart';

abstract class MyWalletState {}

class MyWalletInitial extends MyWalletState {}

class MyWalletLoading extends MyWalletState {}

class MyWalletLoaded extends MyWalletState {
  final MyWalletEntity myWalletEntity;
  MyWalletLoaded(this.myWalletEntity);
}

class MyWalletError extends MyWalletState {
  final String message;
  MyWalletError(this.message);
}
