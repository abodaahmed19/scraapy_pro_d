
import 'package:scraapy_pro/screens/rentals/data/data_source/retals_data_source.dart';
import 'package:scraapy_pro/screens/rentals/domain/entities/retals_item_entity.dart';

abstract class RentalsRepository {

  Future<List<RentalsItemEntity>> getRetals();
}

class RentalsRepositoryImpl implements RentalsRepository{

  final RentalsRemoteDataSource rentalsRemoteDataSource;

  RentalsRepositoryImpl(this.rentalsRemoteDataSource);

  @override
  Future<List<RentalsItemEntity>> getRetals() async{
     return await rentalsRemoteDataSource.getRetals();
  }




}