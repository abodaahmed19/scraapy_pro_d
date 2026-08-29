
import 'package:scraapy_pro/screens/profile/acount_info/data/repositories/my_wallet_transactions_repo.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/entities/transactions_entity.dart';

class MyWalletTransactionsUseCase {
  final MyWalletTransactionsRepo repository;

  MyWalletTransactionsUseCase(this.repository);

  Future<List<MyWalletTransactionEntity>> call() async {
    return await repository.getMyWalletTransactions();
  }
}
