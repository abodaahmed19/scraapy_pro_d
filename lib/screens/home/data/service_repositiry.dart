import 'package:scraapy_pro/screens/home/data/service_data_source.dart';
import 'package:scraapy_pro/screens/home/domain/entities/service_entity.dart';

abstract class ServiceRepository {

  Future<ServiceResponseModel> getServices(String type);
}

class ServiceRepositoryImpl implements ServiceRepository{

  final ServiceRemoteDataSource serviceRemoteDataSource;

  ServiceRepositoryImpl(this.serviceRemoteDataSource);

  @override
  Future<ServiceResponseModel> getServices(String type) async{

    return await serviceRemoteDataSource.getService( type);
  }




}