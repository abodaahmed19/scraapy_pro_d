import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:scraapy_pro/authentication/data/data_sources/auth_data_source.dart';
import 'package:scraapy_pro/authentication/domain/entities/auth_entity.dart';
import 'package:scraapy_pro/core/helpers/cache_service.dart';
import 'package:scraapy_pro/core/storage/session_storage_keys.dart';

/// Calls the Scraapy.net auth endpoints matching the legacy API contract.
class AuthDataSourceImpl implements AuthDataSource {
  static const String _base = 'https://scraapy.net/api/';
  static const Map<String, String> _json = {
    'Content-Type': 'application/json',
  };

  void _logReq(String method, String url, [Object? body]) {
    // logDebug(
    //   '\n\n\n\n.........................................................................\nonRequest: $method request => $url'
    //   '${body != null ? '\nonRequest: Request Data => $body' : ''}',
    // );
  }

  void _logRes(http.Response res, String url) {
    if (res.statusCode >= 200 && res.statusCode < 300) {
      // logDebug(
      //   'onResponse: StatusCode: ${res.statusCode}, Data: ${res.body}\n.........................................................................\n\n\n\n',
      //   level: Level.debug,
      // );
    } else {
      // logDebug(
      //   'onError: StatusCode: ${res.statusCode}, Data: ${res.body}',
      //   level: Level.error,
      // );
    }
  }

  /// Step 1 of login — sends OTP to phone or email.
  /// Endpoint: POST otp/login/  body: {email_or_phone}
  @override
  Future<SendOtpResult> sendOtp(String identifier) async {
    const url = '${_base}otp/login/';
    final reqBody = jsonEncode({'email_or_phone': identifier});
    _logReq('POST', url, reqBody);
    final res = await http.post(Uri.parse(url), headers: _json, body: reqBody);
    _logRes(res, url);

    if (res.statusCode == 200) {
      final body = jsonDecode(res.body) as Map<String, dynamic>;
      return SendOtpResult(phone: body['phone']?.toString() ?? identifier);
    }

    // Non-200: parse error field from response body
    try {
      final body = jsonDecode(res.body) as Map<String, dynamic>;
      final error = body['error']?.toString() ?? '';
      if (error == 'Phone number not found') {
        throw const AuthException(AuthErrorCode.userNotFound);
      }
      if (error == 'Invalid email or phone format') {
        throw const AuthException(AuthErrorCode.invalidIdentifier);
      }
    } on AuthException {
      rethrow;
    } catch (_) {
      // ignore parse errors — fall through to unknown
    }
    throw const AuthException(AuthErrorCode.unknown);
  }

  /// Step 2 of login — verifies OTP and saves session token.
  /// Endpoint: POST otp/verify-otp-token/  body: {phone, otp}
  @override
  Future<String> verifyOtp(String identifier, String code) async {
    const url = '${_base}otp/verify-otp-token/';
    final reqBody = jsonEncode({'phone': identifier, 'otp': code});
    _logReq('POST', url, reqBody);
    final res = await http.post(Uri.parse(url), headers: _json, body: reqBody);
    _logRes(res, url);
    if (res.statusCode != 200) {
      throw const AuthException(AuthErrorCode.unknown);
    }

    final body = jsonDecode(res.body) as Map<String, dynamic>;
    final token = body['token']?.toString() ?? '';
    if (token.isEmpty) throw const AuthException(AuthErrorCode.unknown);

    final user = body['user'] as Map<String, dynamic>? ?? {};
    final expiry = body['expiry']?.toString() ?? '';
    final userType = user['user_type']?.toString() ?? '';

    await Future.wait([
      SecureStorage.write(SessionStorageKeys.token, token),
      SecureStorage.write(SessionStorageKeys.expiry, expiry),
      SecureStorage.write(SessionStorageKeys.name, user['name']?.toString() ?? ''),
      SecureStorage.write(SessionStorageKeys.userType, userType),
      SecureStorage.write(SessionStorageKeys.id, user['id']?.toString() ?? ''),
      SecureStorage.write(SessionStorageKeys.email, user['email']?.toString() ?? ''),
      SecureStorage.write(
        SessionStorageKeys.contactNumber,
        user['contact_number']?.toString() ?? '',
      ),
      SecureStorage.write(SessionStorageKeys.image, user['image']?.toString() ?? ''),
      SecureStorage.write(
        SessionStorageKeys.inviteCode,
        user['invite_code']?.toString() ?? '',
      ),
    ]);

    return userType;
  }

  /// Register step 1 — send phone verification OTP.
  /// Endpoint: POST otp/send/  body: {phone}
  @override
  Future<void> sendVerificationCode(String phone) async {
    const url = '${_base}otp/send/';
    final reqBody = jsonEncode({'phone': phone});
    _logReq('POST', url, reqBody);
    final res =
        await http.post(Uri.parse(url), headers: _json, body: reqBody);
    _logRes(res, url);
  }

  /// Register step 2 — verify phone OTP.
  /// Endpoint: POST otp/verify/  body: {phone, otp}
  @override
  Future<bool> verifyVerificationCode(String phone, String otp) async {
    const url = '${_base}otp/verify/';
    final reqBody = jsonEncode({'phone': phone, 'otp': otp});
    _logReq('POST', url, reqBody);
    final res =
        await http.post(Uri.parse(url), headers: _json, body: reqBody);
    _logRes(res, url);
    return res.statusCode == 200;
  }

  /// Register step 3 — create account.
  /// Endpoint: POST users/  body: {name, email, contact_number, password, user_type, invite_code_used}
  /// Returns 200 on success, 601/602/600 on duplicate fields.
  @override
  Future<int> register({
    required String name,
    required String email,
    required String phone,
    required String accountType,
    String inviteCode = '',
  }) async {
    const url = '${_base}users/';
    final reqBody = jsonEncode({
      'name': name,
      'email': email,
      'contact_number': phone,
      'password': '11111111',
      'user_type': accountType,
      'invite_code_used': inviteCode.isNotEmpty ? inviteCode : null,
    });
    _logReq('POST', url, reqBody);
    final res = await http.post(Uri.parse(url), headers: _json, body: reqBody);
    _logRes(res, url);

    if (res.statusCode == 201) return 200;

    try {
      final body = jsonDecode(res.body) as Map<String, dynamic>;
      final hasEmail =
          body['email'] is List && (body['email'] as List).isNotEmpty;
      final hasPhone = body['contact_number'] is List &&
          (body['contact_number'] as List).isNotEmpty;
      if (hasEmail && hasPhone) return 600;
      if (hasEmail) return 601;
      if (hasPhone) return 602;
    } catch (_) {
      // ignore parse errors
    }
    return res.statusCode;
  }
}
