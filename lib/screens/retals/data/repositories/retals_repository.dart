
import 'package:scraapy_pro/screens/retals/data/data_source/retals_data_source.dart';
import 'package:scraapy_pro/screens/retals/domain/entities/retals_item_entity.dart';

abstract class RetalsRepository {

  Future<List<RetalsItemEntity>> getRetals();
}

class RetalsRepositoryImpl implements RetalsRepository{

  final RetalsRemoteDataSource retalsRemoteDataSource;

  RetalsRepositoryImpl(this.retalsRemoteDataSource);

  @override
  Future<List<RetalsItemEntity>> getRetals() async{
     return await retalsRemoteDataSource.getRetals();
  }




}