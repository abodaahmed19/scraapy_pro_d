import 'dart:convert';

import 'package:multiple_result/multiple_result.dart';
import 'package:scraapy_pro/core/error/failure.dart';
import 'package:scraapy_pro/core/helpers/cache_service.dart';
import 'package:scraapy_pro/core/shared/models/user_model.dart';
import 'package:scraapy_pro/core/storage/session_storage_keys.dart';
import 'package:scraapy_pro/screens/profile/acount_info/data/data_sources/profile_remote_data_source.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/repositories/i_profile_repository.dart';

class ProfileRepositoryImpl implements IProfileRepository {
  ProfileRepositoryImpl({required this.remoteDataSource});
  final ProfileRemoteDataSource remoteDataSource;

  @override
  Future<Result<UserModel, Failure>> fetchMeAndRefreshCache() async {

    try {
      final cached = await _tryReadCachedUser();
      print('1111');
      if (cached != null) return Success(cached);
      print('2222');

      final jsonData = await remoteDataSource.fetchMe();

      final name = jsonData['name']?.toString() ?? '';
      final userTypeStr = jsonData['user_type']?.toString() ?? '';
      final id = jsonData['id']?.toString() ?? '';
      final email = jsonData['email']?.toString() ?? '';
      final contactNumber = jsonData['contact_number']?.toString() ?? '';
      final image = jsonData['image']?.toString() ?? '';
      final inviteCode = jsonData['invite_code']?.toString() ?? '';
      final token = await SecureStorage.read(SessionStorageKeys.token) ?? '';
      final expiry = await SecureStorage.read(SessionStorageKeys.expiry) ?? '';

      await Future.wait([
        SecureStorage.write(SessionStorageKeys.name, name),
        SecureStorage.write(SessionStorageKeys.userType, userTypeStr),
        SecureStorage.write(SessionStorageKeys.id, id),
        SecureStorage.write(SessionStorageKeys.email, email),
        SecureStorage.write(SessionStorageKeys.contactNumber, contactNumber),
        SecureStorage.write(SessionStorageKeys.image, image),
        SecureStorage.write(SessionStorageKeys.inviteCode, inviteCode),
      ]);

      final user = UserModel(
        id: id,
        fullName: name,
        phoneNumber: contactNumber,
        email: email,
        city: '',
        userType: int.tryParse(userTypeStr) ?? 0,
        allowNotify: false,
        token: token,
        profileImageRelative: image,
        inviteCode: inviteCode,
        sessionExpiry: expiry,
      );

      await SecureStorage.write(
        SessionStorageKeys.email,
        jsonEncode(user.toJson()),
      );

      return Success(user);
    } catch (e) {
      return Error(ServerFailure(e.toString()));
    }
  }

  Future<UserModel?> _tryReadCachedUser() async {
    try {
      final raw = await SecureStorage.read(SessionStorageKeys.email);
      if (raw == null || raw.isEmpty) return null;
      final decoded = jsonDecode(raw);
      if (decoded is! Map) return null;
      return UserModel.fromJson(Map<String, dynamic>.from(decoded));
    } catch (_) {
      return null;
    }
  }
}
