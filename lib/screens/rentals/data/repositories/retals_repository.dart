
import 'package:scraapy_pro/screens/rentals/data/data_source/retals_data_source.dart';
import 'package:scraapy_pro/screens/rentals/domain/entities/rentals_entity.dart';
import 'package:scraapy_pro/screens/services/domain/entities/services_entity.dart';

abstract class RentalsRepository {
  Future<ServicesEntity> getRentals();
}

class RentalsRepositoryImpl implements RentalsRepository {
  final RentalsRemoteDataSource rentalsRemoteDataSource;

  RentalsRepositoryImpl(this.rentalsRemoteDataSource);

  @override
  Future<ServicesEntity> getRentals() async {
    return await rentalsRemoteDataSource.getRentals();
  }
}