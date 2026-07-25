/// Result of a successful OTP send — carries the normalised phone back.
class SendOtpResult {
  const SendOtpResult({required this.phone});
  final String phone;
}

/// Status codes returned from the auth API.
enum AuthErrorCode {
  userNotFound,      // 606
  invalidIdentifier, // 607
  emailPhoneExists,  // 600
  emailExists,       // 601
  phoneExists,       // 602
  unknown,
}

/// Auth-specific exception — carries a typed error code.
class AuthException implements Exception {
  const AuthException(this.code);
  final AuthErrorCode code;
}
