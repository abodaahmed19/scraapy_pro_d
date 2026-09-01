import 'package:dio/dio.dart';
import 'package:scraapy_pro/core/config/res/constants_manager.dart';
import 'package:scraapy_pro/core/error/dio_error_handler.dart';
import 'package:scraapy_pro/screens/manifest/domain/entities/danger_mainfest_model.dart';

abstract class MainfestDs {
  Future<void> createMainfest(DangerMainfestModel model);
}

class MainfestDsImpl implements MainfestDs {
  final Dio dio;

  MainfestDsImpl(this.dio);

  @override
  Future<void> createMainfest(DangerMainfestModel model) async {
    try {
      await dio.post(
        '${ConstantManager.baseUrl}/hazardous-waste-transfers//',
        data: model.toJson(),
      );
    } on DioException catch (e) {
      throw DioErrorHandler.handle(e);
    }
  }
}