import 'package:dio/dio.dart';
import 'package:scraapy_pro/screens/permisions/data/remote_ds/permisions_ds.dart';

abstract class PermissionsRepo {
  Future<void> importingDangerWaste(FormData body);
  Future<void> importingNonDangerWaste(FormData body);
  Future<void> exportingDangerWaste(Map<String, dynamic> body);
  Future<void> exportingNonDangerWaste(Map<String, dynamic> body);
}

class PermissionsRepoImpl implements PermissionsRepo {
  final PermisionsDs permissionsDs;

  PermissionsRepoImpl(this.permissionsDs);

  @override
  Future<void> importingDangerWaste(FormData body) async {
    return await permissionsDs.importingDangerWaste(body);
  }

  @override
  Future<void> importingNonDangerWaste(FormData body) async {
    return await permissionsDs.importingNonDangerWaste(body);
  }

  @override
  Future<void> exportingDangerWaste(Map<String, dynamic> body) async {
    return await permissionsDs.exportingDangerWaste(body);
  }

  @override
  Future<void> exportingNonDangerWaste(Map<String, dynamic> body) async {
    return await permissionsDs.exportingNonDangerWaste(body);
  }

}