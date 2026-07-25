import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:scraapy_pro/core/di/injection.dart';
import 'package:scraapy_pro/core/network/network_service.dart';
import 'package:scraapy_pro/core/storage/session_storage_keys.dart';
// import 'package:scraapypro/src/config/res/constants_manager.dart';
// import 'package:scraapypro/src/core/network/network_service.dart';
// import 'package:scraapypro/src/core/storage/session_storage_keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helpers/cache_service.dart';
// import '../../../network/interceptors/log_interceptor.dart';
import '../../models/user_model.dart';

part 'user_state.dart';
part 'user_utils.dart';

const String _userKey = 'user';
const String _tokenKey = 'token';

class UserCubit extends Cubit<UserState> with UserUtils {
  UserCubit() : super(UserState.initial());

  Future<void> setUserLoggedIn(
      {required UserModel user, required String token}) async {
    await Future.wait([
      _saveUser(user),
      _saveToken(token),
    ]);
    getIt<NetworkService>().setToken(token);
    emit(state.copyWith(userModel: user, userStatus: UserStatus.loggedIn));
  }

  Future<void> logout() async {
    await Future.wait([
      // CacheStorage.delete(_userKey),
      SecureStorage.delete(_userKey),
      SecureStorage.delete(_tokenKey),
    ]);
    _clearUser();
  }

  Future<void> updateToken(String token) async {
    await _saveToken(token);
    getIt<NetworkService>().setToken(token);
  }

  Future<void> updateUser(UserModel user) async {
    await _saveUser(user);
    emit(state.copyWith(userModel: user));
  }

  /// Refresh drawer/profile fields from secure storage (e.g. after `fetchMe`).
  Future<void> syncUserFromSecureStorage() async {
    final token = await SecureStorage.read(_tokenKey);
    if (token == null || token.isEmpty || state.userStatus == UserStatus.loggedOut) {
      return;
    }
    final base = UserModel.rebuiltFromUnsafe(state.userModel);
    final name = await SecureStorage.read(SessionStorageKeys.name) ?? '';
    final id = await SecureStorage.read(SessionStorageKeys.id) ?? '';
    final email = await SecureStorage.read(SessionStorageKeys.email) ?? '';
    final phone =
        await SecureStorage.read(SessionStorageKeys.contactNumber) ?? '';
    final image = await SecureStorage.read(SessionStorageKeys.image) ?? '';
    final invite = await SecureStorage.read(SessionStorageKeys.inviteCode) ?? '';
    final expiry = await SecureStorage.read(SessionStorageKeys.expiry) ?? '';

    final merged = base.copyWith(
      fullName: name.isNotEmpty ? name : base.fullName,
      id: id.isNotEmpty ? id : base.id,
      email: email.isNotEmpty ? email : base.email,
      phoneNumber: phone.isNotEmpty ? phone : base.phoneNumber,
      token: token,
      profileImageRelative: image,
      inviteCode: invite,
      sessionExpiry: expiry,
    );
    emit(state.copyWith(userModel: merged));
    await _saveUser(merged);
  }

  Future<bool> init() async {
    final token = await SecureStorage.read(_tokenKey);
    if (token == null || token.isEmpty) return false;

    final image = await SecureStorage.read(SessionStorageKeys.image) ?? '';
    final invite = await SecureStorage.read(SessionStorageKeys.inviteCode) ?? '';
    final expiry = await SecureStorage.read(SessionStorageKeys.expiry) ?? '';

    // Prefer the full UserModel JSON saved by setUserLoggedIn (CacheStorage).
    // final dynamic rawUser = CacheStorage.read(_userKey, isDecoded: true);
    final rawJson = await SecureStorage.read(SessionStorageKeys.email);
    final dynamic rawUser = rawJson != null ? jsonDecode(rawJson) : null;

    UserModel user;
    if (rawUser is Map) {
      final userMap = Map<String, dynamic>.from(rawUser);
      user = UserModel.rebuiltFromUnsafe(UserModel.fromJson(userMap));
      user = user.copyWith(
        profileImageRelative:
            user.profileImageRelative.isEmpty ? image : user.profileImageRelative,
        inviteCode: user.inviteCode.isEmpty ? invite : user.inviteCode,
        sessionExpiry: user.sessionExpiry.isEmpty ? expiry : user.sessionExpiry,
        token: token,
      );
      await _saveUser(user);
    } else {
      // Fallback: reconstruct from the individual fields that
      // AuthDataSourceImpl.verifyOtp saves to SecureStorage.
      final name = await SecureStorage.read(SessionStorageKeys.name) ?? '';
      final id = await SecureStorage.read(SessionStorageKeys.id) ?? '';
      final email = await SecureStorage.read(SessionStorageKeys.email) ?? '';
      final phone =
          await SecureStorage.read(SessionStorageKeys.contactNumber) ?? '';
      user = UserModel(
        id: id,
        fullName: name,
        phoneNumber: phone,
        email: email,
        city: '',
        userType: 0,
        allowNotify: false,
        token: token,
        profileImageRelative: image,
        inviteCode: invite,
        sessionExpiry: expiry,
      );
      // Persist the reconstructed model so the next restart uses the fast path.
      await _saveUser(user);
    }

    getIt<NetworkService>().setToken(token);
    emit(state.copyWith(userModel: user, userStatus: UserStatus.loggedIn));
    return true;
  }

  void _clearUser() {
    getIt<NetworkService>().removeToken();
    emit(UserState.initial());
  }

  UserModel get user => state.userModel;
  static UserCubit get instance  => getIt<UserCubit>();

  bool get isUserLoggedIn => state.userStatus == UserStatus.loggedIn;
}
