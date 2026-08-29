
import 'package:scraapy_pro/screens/profile/acount_info/data/data_sources/my_wallet_transactions_ds.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/entities/transactions_entity.dart';

abstract class MyWalletTransactionsRepo {
  Future<List<MyWalletTransactionEntity>> getMyWalletTransactions();
}

class MyWalletTransactionsRepoImpl implements MyWalletTransactionsRepo {
  final MyWalletTransactionsDs myWalletTransactionsDs;

  MyWalletTransactionsRepoImpl(this.myWalletTransactionsDs);

  @override
  Future<List<MyWalletTransactionEntity>> getMyWalletTransactions() async {
    return await myWalletTransactionsDs.getMyWalletTransactions();
  }
}
