
import 'package:scraapy_pro/screens/profile/acount_info/domain/entities/transactions_entity.dart';

abstract class MyWalletTransactionsState {}

class MyWalletTransactionsInitial extends MyWalletTransactionsState {}

class MyWalletTransactionsLoading extends MyWalletTransactionsState {}

class MyWalletTransactionsLoaded extends MyWalletTransactionsState {
  final List<MyWalletTransactionEntity> transactions;
  MyWalletTransactionsLoaded(this.transactions);
}

class MyWalletTransactionsError extends MyWalletTransactionsState {
  final String message;
  MyWalletTransactionsError(this.message);
}
