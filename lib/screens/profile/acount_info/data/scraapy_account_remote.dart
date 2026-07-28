import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:scraapy_pro/core/config/res/constants_manager.dart';
import 'package:scraapy_pro/core/di/injection.dart';
import 'package:scraapy_pro/core/helpers/cache_service.dart';
import 'package:scraapy_pro/core/shared/models/user_model.dart';
import 'package:scraapy_pro/core/storage/session_storage_keys.dart';

/// Legacy Scraapy.net / Knox calls used by account, wallet, profile, tickets.
abstract final class ScraapyAccountRemote {
  static Uri _u(String path) => Uri.parse('${ConstantManager.baseUrl2}$path');

  static Future<String?> _token() => getIt<SecureStorage>().read(SessionStorageKeys.token);

  static Future<Map<String, dynamic>> fetchMeAndRefreshCache() async {
    final token = await _token();
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
    final jsonData = json.decode(res.body) as Map<String, dynamic>;
    final expiry = await getIt<SecureStorage>().read(SessionStorageKeys.expiry) ?? '';
    final name = jsonData['name']?.toString() ?? '';
    final userType = jsonData['user_type']?.toString() ?? '';
    final id = jsonData['id']?.toString() ?? '';
    final email = jsonData['email']?.toString() ?? '';
    final contactNumber = jsonData['contact_number']?.toString() ?? '';
    final image = jsonData['image']?.toString() ?? '';
    final inviteCode = jsonData['invite_code']?.toString() ?? '';

    await Future.wait([
      getIt<SecureStorage>().write(SessionStorageKeys.expiry, expiry),
      getIt<SecureStorage>().write(SessionStorageKeys.token, token),
      getIt<SecureStorage>().write(SessionStorageKeys.name, name),
      getIt<SecureStorage>().write(SessionStorageKeys.userType, userType),
      getIt<SecureStorage>().write(SessionStorageKeys.id, id),
      getIt<SecureStorage>().write(SessionStorageKeys.email, email),
      getIt<SecureStorage>().write(SessionStorageKeys.contactNumber, contactNumber),
      getIt<SecureStorage>().write(SessionStorageKeys.image, image),
      getIt<SecureStorage>().write(SessionStorageKeys.inviteCode, inviteCode),
    ]);

    final user = UserModel(
      id: id,
      fullName: name,
      phoneNumber: contactNumber,
      email: email,
      city: '',
      userType: int.tryParse(userType) ?? 0,
      allowNotify: false,
      token: token,
      profileImageRelative: image,
      inviteCode: inviteCode,
      sessionExpiry: expiry,
    );
    await getIt<SecureStorage>().write(
      SessionStorageKeys.email,
      jsonEncode(user.toJson()),
    );

    return jsonData;
  }

  static Future<bool> updateUser({
    required String name,
    required String email,
    required String contactNumber,
  }) async {
    final token = await _token();
    if (token == null) return false;
    final res = await http.patch(
      _u('users/me/'),
      headers: {
        'Authorization': 'Token $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': name,
        'email': email,
        'contact_number': contactNumber,
      }),
    );
    return res.statusCode == 200;
  }

  static Future<bool> deleteUser(String currentPassword) async {
    final token = await _token();
    if (token == null) return false;
    final res = await http.delete(
      _u('users/me/'),
      headers: {
        'Authorization': 'Token $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'current_password': currentPassword}),
    );
    return res.statusCode == 200;
  }

  /// Legacy `otp/send/` + `otp/verify/` (no auth header).
  static Future<bool> sendOtpRAnis(String phoneE164) async {
    final res = await http.post(
      _u('otp/send/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'phone': phoneE164}),
    );
    return res.statusCode == 200;
  }

  static Future<bool> verifyOtpRAnis(String phoneE164, String code) async {
    final res = await http.post(
      _u('otp/verify/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'phone': phoneE164, 'otp': code}),
    );
    return res.statusCode == 200;
  }

  static Future<void> sendContactMessage(Map<String, dynamic> body) async {
    final res = await http.post(
      _u('document/contact/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );
    if (res.statusCode != 201) {
      throw Exception('contact_failed');
    }
  }

  static String _ticketPhoneFilter(String? storedContact) {
    if (storedContact == null || storedContact.isEmpty) return '';
    if (storedContact.length > 4 && storedContact.startsWith('+966')) {
      return '0${storedContact.substring(4)}';
    }
    if (storedContact.length > 3 && storedContact.startsWith('966')) {
      return '0${storedContact.substring(3)}';
    }
    return storedContact;
  }

  static Future<List<Map<String, dynamic>>> fetchMyTickets() async {
    final token = await _token();
    final contact = await getIt<SecureStorage>().read(SessionStorageKeys.contactNumber);
    if (token == null) throw Exception('unauthorized');
    final res = await http.get(
      _u('document/contact/'),
      headers: {'Authorization': 'Token $token'},
    );
    if (res.statusCode != 200) throw Exception('tickets_failed');
    final data = json.decode(res.body);
    if (data is! List) throw Exception('tickets_bad_shape');
    final want = _ticketPhoneFilter(contact);
    return data
        .whereType<Map>()
        .map((e) => Map<String, dynamic>.from(e))
        .where((item) => item['phone']?.toString() == want)
        .toList();
  }

  static Future<Map<String, dynamic>?> walletMe() async {
    final token = await _token();
    if (token == null) return null;
    final res = await http.get(
      Uri.parse('${ConstantManager.baseUrl2}wallet/wallets/me/'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token $token',
      },
    );
    if (res.statusCode != 200) return null;
    return json.decode(res.body) as Map<String, dynamic>;
  }

  static Future<List<dynamic>> walletTransactions() async {
    final token = await _token();
    if (token == null) return [];
    final res = await http.get(
      Uri.parse('${ConstantManager.baseUrl2}wallet/wallets/transactions/'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token $token',
      },
    );
    if (res.statusCode != 200) return [];
    final data = json.decode(res.body);
    if (data is Map<String, dynamic>) {
      return List<dynamic>.from(data['results'] as List? ?? []);
    }
    if (data is List) return data;
    return [];
  }

  static Future<int> submitTransfer({
    required double amount,
    required String targetPhone,
    required String description,
  }) async {
    final token = await _token();
    if (token == null) return 500;
    try {
      final res = await http.post(
        Uri.parse('${ConstantManager.baseUrl2}wallet/wallets/transfer/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token',
        },
        body: jsonEncode({
          'amount': amount,
          'target_phone': targetPhone,
          'description': description,
        }),
      );
      if (res.statusCode == 200 || res.statusCode == 201) return 200;
      final body = json.decode(res.body);
      final detail = body is Map ? body['detail']?.toString() : null;
      if (detail == 'Cannot transfer to yourself.') return 403;
      if (detail == 'User with this phone number does not exist in Scraapy.') {
        return 415;
      }
      return 404;
    } catch (_) {
      return 500;
    }
  }

  static Future<int> submitBankTransferRequest({
    required double amount,
    required String bankName,
    required String bankAccountNumber,
    required String userEmail,
    required String userPhone,
  }) async {
    final token = await _token();
    if (token == null) return 500;
    try {
      final res = await http.post(
        Uri.parse(
          '${ConstantManager.baseUrl2}wallet/wallets/bank-transfer-request/',
        ),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token',
        },
        body: jsonEncode({
          'amount': amount,
          'bank_name': bankName,
          'bank_account_number': bankAccountNumber,
          'user_email': userEmail,
          'user_phone': userPhone,
        }),
      );
      if (res.statusCode == 200 || res.statusCode == 201) return 200;
      final body = json.decode(res.body);
      if (body is Map && body['error'] == 'Insufficient balance.') return 409;
      if (body is Map && body['error'] == 'You have a pending request') {
        return 408;
      }
      return 400;
    } catch (_) {
      return 500;
    }
  }

  // static Future<List<SavedAddress>> fetchAddresses() async {
  //   final token = await _token();
  //   if (token == null || token.isEmpty) {
  //     throw Exception('no_token');
  //   }
  //   final res = await http.get(
  //     _u('users/address/'),
  //     headers: {
  //       'Authorization': 'Token $token',
  //       'Content-Type': 'application/json',
  //     },
  //   );
  //   if (res.statusCode != 200) {
  //     throw Exception('address_fetch');
  //   }
  //   final decoded = json.decode(res.body);
  //   List<dynamic> raw = [];
  //   if (decoded is Map<String, dynamic>) {
  //     final d = decoded['data'];
  //     if (d is List) raw = d;
  //   } else if (decoded is List) {
  //     raw = decoded;
  //   }
  //   return raw
  //       .whereType<Map>()
  //       .map((e) => SavedAddress.fromJson(Map<String, dynamic>.from(e)))
  //       .toList();
  // }
  //
  // static Future<bool> addAddress(SavedAddress a) async {
  //   final token = await _token();
  //   if (token == null) return false;
  //   final res = await http.post(
  //     _u('users/address/'),
  //     headers: {
  //       'Authorization': 'Token $token',
  //       'Content-Type': 'application/json',
  //     },
  //     body: jsonEncode(a.toJson()..remove('id')),
  //   );
  //   return res.statusCode == 200 || res.statusCode == 201;
  // }
  //
  // static Future<bool> updateAddress(SavedAddress a) async {
  //   final token = await _token();
  //   final id = a.id;
  //   if (token == null || id == null) return false;
  //   final res = await http.patch(
  //     _u('users/address/$id/'),
  //     headers: {
  //       'Authorization': 'Token $token',
  //       'Content-Type': 'application/json',
  //     },
  //     body: jsonEncode(a.toJson()),
  //   );
  //   return res.statusCode == 200;
  // }

  static Future<bool> deleteAddress(int id) async {
    final token = await _token();
    if (token == null) return false;
    final res = await http.delete(
      _u('users/address/$id/'),
      headers: {
        'Authorization': 'Token $token',
        'Content-Type': 'application/json',
      },
    );
    return res.statusCode == 200;
  }

  static Future<bool> uploadProfileImage(File file) async {
    final token = await _token();
    if (token == null) return false;
    final uri = Uri.parse('${ConstantManager.baseUrl2}users/me/');
    final request = http.MultipartRequest('PATCH', uri)
      ..headers['Authorization'] = 'Token $token'
      ..headers['Accept'] = 'application/json'
      ..files.add(await http.MultipartFile.fromPath('image', file.path));
    final streamed = await request.send();
    final response = await http.Response.fromStream(streamed);
    if (response.statusCode != 200) return false;
    final data = json.decode(response.body) as Map<String, dynamic>;
    final img = data['image']?.toString() ?? '';
    await getIt<SecureStorage>().write(SessionStorageKeys.image, img);
    return true;
  }

  static Future<bool> uploadProfileImageBytes(List<int> bytes, String filename) async {
    final token = await _token();
    if (token == null) return false;
    final uri = Uri.parse('${ConstantManager.baseUrl2}users/me/');
    final request = http.MultipartRequest('PATCH', uri)
      ..headers['Authorization'] = 'Token $token'
      ..headers['Accept'] = 'application/json'
      ..files.add(
        http.MultipartFile.fromBytes('image', bytes, filename: filename),
      );
    final streamed = await request.send();
    final response = await http.Response.fromStream(streamed);
    if (response.statusCode != 200) return false;
    final data = json.decode(response.body) as Map<String, dynamic>;
    final img = data['image']?.toString() ?? '';
    await getIt<SecureStorage>().write(SessionStorageKeys.image, img);
    return true;
  }
}
