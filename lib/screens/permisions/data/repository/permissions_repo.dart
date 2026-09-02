import 'package:dio/dio.dart';
import 'package:scraapy_pro/screens/permisions/data/remote_ds/permisions_ds.dart';

abstract class PermissionsRepo {
  Future<void> importingDangerWaste(FormData body);
  Future<void> importingNonDangerWaste(FormData body);
  Future<void> exportingDangerWaste(FormData body);
  Future<void> exportingNonDangerWaste(FormData body);
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
  Future<void> exportingDangerWaste(FormData body) async {
    return await permissionsDs.exportingDangerWaste(body);
  }

  @override
  Future<void> exportingNonDangerWaste(FormData body) async {
    return await permissionsDs.exportingNonDangerWaste(body);
  }

}