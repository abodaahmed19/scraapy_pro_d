import 'package:dio/dio.dart';
import 'package:scraapy_pro/core/di/injection.dart';
import 'package:scraapy_pro/screens/favorites/domain/entities/favorite_item_entity.dart';


abstract class FavoriteRemoteDataSource {
  Future<List<FavoriteItemModel>> getFavorites();
}

class FavoriteRemoteDataSourceImpl implements FavoriteRemoteDataSource {
  final Dio dio;

  FavoriteRemoteDataSourceImpl(this.dio);



  @override
  Future<List<FavoriteItemModel>> getFavorites() async {
    await Future.delayed(const Duration(seconds: 1)); // simulate loading

    final mockResponse =
    [
      {
        "id": 204,
        "name": "مكينة تدوير الأطعمة الى سماد",
        "hs_code": null,
        "trader_name": "شركة باهظ للتجارة",
        "images": [
          "/media/item_images/183d7a2c-d97f-4b69-bafc-aaaf03827f50.jpeg"
        ],
        "created_at": "2026-04-19T18:07:48.054258+03:00",
        "price": "800.00"
      }
    ];
    return List<FavoriteItemModel>.from(
      mockResponse.map((e) => FavoriteItemModel.fromJson(e)),
    );
  }


  // @override
  // Future<List<FavoriteItemModel>> getFavorites() async {
  //   try {
  //     final dio = getIt<Dio>();
  //
  //     final response = await dio.get(
  //       'https://vmi2584358.contaboserver.net/api/inventory/favorites/', //  غيريها حسب endpoint عندك
  //     );
  //
  //     /// ✅ لو API بيرجع List مباشرة
  //     final data = response.data;
  //
  //     /// ❗ لو بيرجع بالشكل ده:
  //     /// { "count": 10, "results": [...] }
  //     /// استخدمي السطر ده بدل اللي فوق:
  //     // final data = response.data['results'];
  //
  //     return List<FavoriteItemModel>.from(
  //       data.map((e) => FavoriteItemModel.fromJson(e)),
  //     );
  //
  //   } on DioException catch (e) {
  //     /// 🔥 Error handling احترافي
  //     if (e.response != null) {
  //       throw Exception(e.response?.data['message'] ?? 'Server error');
  //     } else {
  //       throw Exception('No internet connection');
  //     }
  //   } catch (e) {
  //     throw Exception('Unexpected error: $e');
  //   }
  // }
  //


}