import 'package:scraapy_pro/screens/manifest/data/remote_data_source/mainfest_ds.dart';
import 'package:scraapy_pro/screens/manifest/domain/entities/danger_mainfest_model.dart';

abstract class MainfestRepo {
  Future<void> createMainfest(DangerMainfestModel model);
  Future<void> createDangerMainfest(DangerMainfestModel model);
}

class MainfestRepoImpl implements MainfestRepo {
  final MainfestDs mainfestDs;

  MainfestRepoImpl(this.mainfestDs);

  @override
  Future<void> createMainfest(DangerMainfestModel model) async {
    return await mainfestDs.createMainfest(model);
  }

  @override
  Future<void> createDangerMainfest(DangerMainfestModel model) async {
    return await mainfestDs.createDangerMainfest(model);
  }
}