import 'package:dio/dio.dart';
import 'package:scraapy_pro/core/config/res/constants_manager.dart';
import 'package:scraapy_pro/core/di/injection.dart';
import 'package:scraapy_pro/core/error/dio_error_handler.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/entities/address_entity.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/entities/branches_entity.dart';

abstract class BranchesDataSource {
  Future<BranchesEntity> getAllBranches();
  Future<void> addAddress(AddressEntity addressEntity);
}

class BranchesDataSourceImp extends BranchesDataSource {
  @override
  // Future<BranchesEntity> getAllBranches() async {
  //   try {
  //     final dio = getIt<Dio>();
  //     // MAKE SURE IT IS THE SAME OF REGISTERED DIO HASH: dio.hashCode SO IT IS ONE DIO INSTANCE
  //     print("DIO HASH: ${dio.hashCode}");
  //     final response = await dio.get(
  //       '${ConstantManager.baseUrl}/branches-list/',
  //     );
  //
  //     return BranchesEntity.fromJson(response.data);
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       throw Exception(e.response?.data['message'] ?? 'Server error');
  //     } else {
  //       throw Exception('No internet connection');
  //     }
  //   } catch (e) {
  //     throw Exception('Unexpected error: $e');
  //   }
  // }
  Future<BranchesEntity> getAllBranches() async {
    try {
      final dio = getIt<Dio>();
      // MAKE SURE IT IS THE SAME OF REGISTERED DIO HASH: dio.hashCode SO IT IS ONE DIO INSTANCE
      print("DIO HASH: ${dio.hashCode}");
      final response = await dio.get(
        '${ConstantManager.baseUrl}/branches-list/',
      );

      return BranchesEntity.fromJson(response.data);
    } on DioException catch (e) {
      throw DioErrorHandler.handle(e);

    }
  }

  @override
  Future<void> addAddress(AddressEntity addressEntity) async {
    try {
      final dio = getIt<Dio>();
      final response = await dio.post(
        '${ConstantManager.baseUrl}/users/address/',
        data: addressEntity.toJson(),
      );

      // return BranchesEntity.fromJson(response.data);
    } on DioException catch (e) {
      throw DioErrorHandler.handle(e);

    }
  }
}