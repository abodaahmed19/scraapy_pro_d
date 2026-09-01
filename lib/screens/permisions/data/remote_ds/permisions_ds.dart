import 'package:dio/dio.dart';
import 'package:scraapy_pro/core/config/res/constants_manager.dart';
import 'package:scraapy_pro/core/error/dio_error_handler.dart';

abstract class PermisionsDs {
  Future<void> importingDangerWaste(FormData body);
  Future<void> importingNonDangerWaste(Map<String, dynamic> body);
  Future<void> exportingDangerWaste(Map<String, dynamic> body);
  Future<void> exportingNonDangerWaste(Map<String, dynamic> body);
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
  Future<void> importingNonDangerWaste(Map<String, dynamic> body) async {
    try {
      await dio.post(
        '${ConstantManager.baseUrl}/non-hazardous-license/create/',
        data: body,
      );
    } on DioException catch (e) {
      throw DioErrorHandler.handle(e);
    }
  }

  @override
  Future<void> exportingDangerWaste(Map<String, dynamic> body) async{
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
  Future<void> exportingNonDangerWaste(Map<String, dynamic> body) async {
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