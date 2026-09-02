import 'package:dio/dio.dart';
import 'package:scraapy_pro/core/config/res/constants_manager.dart';
import 'package:scraapy_pro/core/error/dio_error_handler.dart';
import 'package:scraapy_pro/screens/services/domain/entities/services_entity.dart';

abstract class QuotationDs {
  Future<void> reqForQuotation(Map<String,dynamic> data);
}

class QuotationDsImpl implements QuotationDs {
  final Dio dio;

  QuotationDsImpl(this.dio);






  @override
  Future<void> reqForQuotation(Map<String,dynamic> data) async{
    try {
      await dio.post(
        '${ConstantManager.baseUrl}/inventory/request-quotation/',
        data: data,
      );
    } on DioException catch (e) {
      throw DioErrorHandler.handle(e);
    }
  }




}