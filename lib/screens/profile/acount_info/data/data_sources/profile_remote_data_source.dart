import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:scraapy_pro/core/config/res/constants_manager.dart';
import 'package:scraapy_pro/core/di/injection.dart';
import 'package:scraapy_pro/core/helpers/cache_service.dart';
import 'package:scraapy_pro/core/storage/session_storage_keys.dart';

abstract class ProfileRemoteDataSource {
  Future<Map<String, dynamic>> fetchMe();
}


class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  static Uri _u(String path) => Uri.parse('${ConstantManager.baseUrl2}$path');

  @override
  Future<Map<String, dynamic>> fetchMe() async {
    final token = await getIt<SecureStorage>().read(SessionStorageKeys.token);
    if (token == null || token.isEmpty) {
      throw Exception('unauthorized');
    }
    final res = await http.get(
      _u('users/me/'),
      headers: {'Authorization': 'Token $token'},
    );
    if (res.statusCode != 200) {
      throw Exception('user_load_failed');
    }
    return json.decode(res.body) as Map<String, dynamic>;
  }
}
