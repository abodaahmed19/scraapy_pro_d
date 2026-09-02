
import 'package:scraapy_pro/screens/services/data/data_source/services_data_source.dart';
import 'package:scraapy_pro/screens/services/domain/entities/services_entity.dart';
import 'package:scraapy_pro/screens/shared_feature/product_item_card/data/remote_data_source/quotation_ds.dart';

abstract class QuotationRepository {
  Future<void> addQuotation(Map<String,dynamic> data);
}

class QuotationRepositoryImpl implements QuotationRepository {
  final QuotationDs quotationDs;

  QuotationRepositoryImpl(this.quotationDs);



  @override
  Future<void> addQuotation(Map<String,dynamic> data) async {
    return await quotationDs.reqForQuotation(data);
  }
}