import 'package:scraapy_pro/screens/quotes/data/remote_ds/quotes_list_remote_ds.dart';
import 'package:scraapy_pro/screens/quotes/domain/entities/quotes_list_model.dart';

abstract class QuotesListRepository {
  Future<QuotesListModel> getQuotesList();
}

class QuotesListRepositoryImpl implements QuotesListRepository {
  final QuotesListRemoteDs quotesListRemoteDs;

  QuotesListRepositoryImpl(this.quotesListRemoteDs);

  @override
  Future<QuotesListModel> getQuotesList() async {
    return await quotesListRemoteDs.getQuotesList();
  }
}
