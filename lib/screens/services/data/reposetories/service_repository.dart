
import 'package:scraapy_pro/screens/services/data/data_sources/service_data_source.dart';
import 'package:scraapy_pro/screens/services/doman/entities/service_entity.dart';

abstract class ServiceRepository {
  Future<List<ServiceEntity>> getServices();
}
class ServiceRepositoryImpl implements ServiceRepository {
  final ServiceRemoteDataSource serviceRemoteDataSource;

  ServiceRepositoryImpl(this.serviceRemoteDataSource);

  @override
  Future<List<ServiceEntity>> getServices() async {
    return await serviceRemoteDataSource.getServices();
  }
}