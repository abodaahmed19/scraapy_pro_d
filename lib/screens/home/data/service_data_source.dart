import 'package:dio/dio.dart';
import 'package:scraapy_pro/core/di/injection.dart';
import 'package:scraapy_pro/screens/favorites/domain/entities/favorite_item_entity.dart';
import 'package:scraapy_pro/screens/home/domain/entities/service_entity.dart';


abstract class ServiceRemoteDataSource {
  Future<ServiceResponseModel> getService(String type);
}

class ServiceRemoteDataSourceImpl implements ServiceRemoteDataSource {
  final Dio dio;

  ServiceRemoteDataSourceImpl(this.dio);



  @override
  Future<ServiceResponseModel> getService(String type) async {
    await Future.delayed(const Duration(seconds: 1)); // simulate loading

    final mockResponse =
    {
      "count": 12,
      "next": "https://vmi2584358.contaboserver.net/api/inventory/items/$type/?page=2",
      "previous": null,
      "results": {
        "data": [
          {
            "id": 237,
            "images": [
              {
                "id": 168,
                "image": "https://vmi2584358.contaboserver.net/media/item_images/df571401-8214-4bdc-882a-a852ee4b3e95.jpeg",
                "is_thumbnail": false
              }
            ],
            "name": "فك ونقل عفش",
            "price": "1500.00",
            "quantity": 1,
            "city": "الظهران",
            "is_favorite": false
          },
          {
            "id": 236,
            "images": [
              {
                "id": 167,
                "image": "https://vmi2584358.contaboserver.net/media/item_images/00f8044b-70db-4667-8479-89b891c2617f.jpeg",
                "is_thumbnail": false
              }
            ],
            "name": "توريد مياه غير صالحه للشرب",
            "price": "100.00",
            "quantity": 1,
            "city": "الظهران",
            "is_favorite": false
          },
          {
            "id": 218,
            "images": [
              {
                "id": 149,
                "image": "https://vmi2584358.contaboserver.net/media/item_images/f5f5a260-d739-4532-913e-fe62720f2e26.jpeg",
                "is_thumbnail": false
              }
            ],
            "name": "سحب صرف صحي",
            "price": "600.00",
            "quantity": 1,
            "city": "الظهران",
            "is_favorite": false
          },
          {
            "id": 217,
            "images": [
              {
                "id": 148,
                "image": "https://vmi2584358.contaboserver.net/media/item_images/641fec1e-1666-4c84-8e06-511e5e7cf6d7.jpg",
                "is_thumbnail": false
              }
            ],
            "name": "ديانا نقل عادي 3.5 طن",
            "price": "1000.00",
            "quantity": 1,
            "city": "الظهران",
            "is_favorite": false
          },
          {
            "id": 211,
            "images": [
              {
                "id": 138,
                "image": "https://vmi2584358.contaboserver.net/media/item_images/61a22605-545c-4a4f-a5f6-f3b6a30e32a4.jpeg",
                "is_thumbnail": false
              }
            ],
            "name": "خدمات هدم",
            "price": "2000.00",
            "quantity": 1,
            "city": "الظهران",
            "is_favorite": false
          },
          {
            "id": 209,
            "images": [
              {
                "id": 136,
                "image": "https://vmi2584358.contaboserver.net/media/item_images/b101fabe-40d0-4360-964d-8352733f2985.jpeg",
                "is_thumbnail": false
              }
            ],
            "name": "توريد ماء للشرب",
            "price": "150.00",
            "quantity": 0,
            "city": "الظهران",
            "is_favorite": false
          },
          {
            "id": 208,
            "images": [
              {
                "id": 135,
                "image": "https://vmi2584358.contaboserver.net/media/item_images/4ff064db-186d-4c06-ad0d-0c46c23e61ac.jpg",
                "is_thumbnail": false
              }
            ],
            "name": "ديانا نقل عادي 1.5 طن",
            "price": "1000.00",
            "quantity": 1,
            "city": "الظهران",
            "is_favorite": false
          },
          {
            "id": 200,
            "images": [
              {
                "id": 127,
                "image": "https://vmi2584358.contaboserver.net/media/item_images/058cca20-bb1c-448d-bb1f-8a22c9bb55b2.jpeg",
                "is_thumbnail": false
              }
            ],
            "name": "حاويات تجارية",
            "price": "4140.00",
            "quantity": 1,
            "city": "الرياض",
            "is_favorite": false
          },
          {
            "id": 199,
            "images": [
              {
                "id": 126,
                "image": "https://vmi2584358.contaboserver.net/media/item_images/b01afdf4-e892-4656-84c8-8e36bc81d8dc.jpg",
                "is_thumbnail": false
              }
            ],
            "name": "حاويات تجارية",
            "price": "4600.00",
            "quantity": 1,
            "city": "الرياض",
            "is_favorite": false
          },
          {
            "id": 197,
            "images": [
              {
                "id": 124,
                "image": "https://vmi2584358.contaboserver.net/media/item_images/56d6cbbd-2791-450a-85db-35d558f0f832.jpg",
                "is_thumbnail": false
              }
            ],
            "name": "مكبس نفايات",
            "price": "1725.00",
            "quantity": 1,
            "city": "الرياض",
            "is_favorite": false
          }
        ],
        "categories": [
          {
            "id": 23,
            "name": "خدمات",
            "name_ar": "خدمات",
            "icon": "https://vmi2584358.contaboserver.net/media/categorygroup_icons/%D8%AE%D8%AF%D9%85%D8%A7%D8%AA.png",
            "group_type": "service"
          },
          {
            "id": 50,
            "name": "inspections",
            "name_ar": "فحص",
            "icon": "https://vmi2584358.contaboserver.net/media/categorygroup_icons/inspections.png",
            "group_type": "service"
          }
        ],
        "price_range": {
          "min_price": 100,
          "max_price": 5750
        }
      }
    };
    return ServiceResponseModel.fromJson(mockResponse);

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