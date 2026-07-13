import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final FlutterSecureStorage storage;

  AuthService(this.storage);

  static const _tokenKey = 'auth_token';

  ///  Save token
  Future<void> saveToken(String token) async {
    await storage.write(key: _tokenKey, value: token);
  }

  ///  Get token
  Future<String?> getToken() async {
    return await storage.read(key: _tokenKey);
  }

  ///  Clear token (logout)
  Future<void> clearToken() async {
    await storage.delete(key: _tokenKey);
  }
}