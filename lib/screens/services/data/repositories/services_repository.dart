
import 'package:scraapy_pro/screens/services/data/data_source/services_data_source.dart';
import 'package:scraapy_pro/screens/services/domain/entities/services_entity.dart';

abstract class ServicesRepository {
  Future<ServicesEntity> getServices();
}

class ServicesRepositoryImpl implements ServicesRepository {
  final ServicesRemoteDataSource servicesRemoteDataSource;

  ServicesRepositoryImpl(this.servicesRemoteDataSource);

  @override
  Future<ServicesEntity> getServices() async {
    return await servicesRemoteDataSource.getServices();
  }
}