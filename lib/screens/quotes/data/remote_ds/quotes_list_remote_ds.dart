import 'package:dio/dio.dart';
import 'package:scraapy_pro/core/config/res/constants_manager.dart';
import 'package:scraapy_pro/screens/quotes/domain/entities/quotes_list_model.dart';

abstract class QuotesListRemoteDs {
  Future<QuotesListModel> getQuotesList();
}

class QuotesRemoteDsImpl implements QuotesListRemoteDs {
  final Dio dio;

  QuotesRemoteDsImpl(this.dio);

  @override
  Future<QuotesListModel> getQuotesList() async {
    final response = await dio.get('${ConstantManager.baseUrl}/inventory/request-quotations/list/');

    return QuotesListModel.fromJson(response.data);
  }
}