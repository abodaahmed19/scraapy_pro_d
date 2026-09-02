import 'package:dio/dio.dart';
import 'package:scraapy_pro/core/config/res/constants_manager.dart';
import 'package:scraapy_pro/core/error/dio_error_handler.dart';

abstract class PermisionsDs {
  Future<void> importingDangerWaste(FormData body);
  Future<void> importingNonDangerWaste(FormData body);
  Future<void> exportingDangerWaste(FormData body);
  Future<void> exportingNonDangerWaste(FormData body);
}

class PermisionsDsImpl implements PermisionsDs {
  final Dio dio;

  PermisionsDsImpl(this.dio);

  @override
  Future<void> importingDangerWaste(FormData body) async {
    try {
      await dio.post(
        '${ConstantManager.baseUrl}/hazardous-license/create/',
        data: body,
      );
    } on DioException catch (e) {

      throw DioErrorHandler.handle(e);
    }
  }

  @override
  Future<void> importingNonDangerWaste(FormData body) async {
    try {
      await dio.post(
        '${ConstantManager.baseUrl}/non-hazardous-license/create/',
        data: body,
      );
    } on DioException catch (e) {
      // print(e.response?.data);
      // print(e.response?.statusCode);
      throw DioErrorHandler.handle(e);
    }
  }

  @override
  Future<void> exportingDangerWaste(FormData body) async{
    try {
      await dio.post(
        '${ConstantManager.baseUrl}/hazardous-export-license/create/',
        data: body,
      );
    } on DioException catch (e) {

      throw DioErrorHandler.handle(e);
    }
  }

  @override
  Future<void> exportingNonDangerWaste(FormData body) async {
    try {
      await dio.post(
        '${ConstantManager.baseUrl}/non-hazardous-export-license/create/',
        data: body,
      );
    } on DioException catch (e) {

      throw DioErrorHandler.handle(e);
    }
  }




}