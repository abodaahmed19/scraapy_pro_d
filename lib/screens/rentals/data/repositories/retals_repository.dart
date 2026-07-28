
import 'package:scraapy_pro/screens/rentals/data/data_source/retals_data_source.dart';
import 'package:scraapy_pro/screens/rentals/domain/entities/rentals_entity.dart';

abstract class RentalsRepository {
  Future<RentalsEntity> getRentals();
}

class RentalsRepositoryImpl implements RentalsRepository {
  final RentalsRemoteDataSource rentalsRemoteDataSource;

  RentalsRepositoryImpl(this.rentalsRemoteDataSource);

  @override
  Future<RentalsEntity> getRentals() async {
    return await rentalsRemoteDataSource.getRentals();
  }
}