import 'package:dio/dio.dart';
import 'package:scraapy_pro/core/config/res/constants_manager.dart';
import 'package:scraapy_pro/core/error/dio_error_handler.dart';
import 'package:scraapy_pro/screens/services/domain/entities/services_entity.dart';

abstract class ServicesRemoteDataSource {
  Future<ServicesEntity> getServices();
  Future<void> reqForQuotation(Map<String,dynamic> data);
}

class ServicesRemoteDataSourceImpl implements ServicesRemoteDataSource {
  final Dio dio;

  ServicesRemoteDataSourceImpl(this.dio);



  @override
  Future<ServicesEntity> getServices() async {
    final response = await dio.get('https://vmi2584358.contaboserver.net/api/inventory/items/service/');

    return ServicesEntity.fromJson(response.data);
  }



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