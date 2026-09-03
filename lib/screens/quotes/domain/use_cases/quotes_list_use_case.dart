import 'package:scraapy_pro/screens/quotes/data/repositories/quotes_list_repository.dart';
import 'package:scraapy_pro/screens/quotes/domain/entities/quotes_list_model.dart';

class GetQuotesListUseCase {
  final QuotesListRepository repository;

  GetQuotesListUseCase(this.repository);

  Future<QuotesListModel> call() async {
    return await repository.getQuotesList();
  }
}
