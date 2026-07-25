class UserModel {
  final String id;
  final String fullName;
  final String phoneNumber;
  final String email;
  final String city;
  final int userType;
  final bool allowNotify;
  final String? token;

  /// Relative media path for profile image (e.g. from `users/me/`).
  final String profileImageRelative;

  /// User invite code for sharing.
  final String inviteCode;

  /// Session expiry ISO string from Knox / legacy API (empty = no check).
  final String sessionExpiry;

  UserModel({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.city,
    required this.userType,
    required this.allowNotify,
    required this.token,
    this.profileImageRelative = '',
    this.inviteCode = '',
    this.sessionExpiry = '',
  });

  factory UserModel.initial() => UserModel(
    id: '',
    fullName: '',
    phoneNumber: '',
    email: '',
    city: '',
    userType: 0,
    allowNotify: false,
    token: '',
    profileImageRelative: '',
    inviteCode: '',
    sessionExpiry: '',
  );

  /// Clears invalid/nullable field states (e.g. after hot reload or old cache JSON).
  factory UserModel.rebuiltFromUnsafe(UserModel u) {
    String safeStr(String Function() read) {
      try {
        return read();
      } on TypeError catch (_) {
        return '';
      } on Object {
        return '';
      }
    }

    int safeInt() {
      try {
        return u.userType;
      } on Object {
        return 0;
      }
    }

    bool safeBool() {
      try {
        return u.allowNotify;
      } on Object {
        return false;
      }
    }

    String? safeToken() {
      try {
        return u.token;
      } on Object {
        return null;
      }
    }

    return UserModel(
      id: safeStr(() => u.id),
      fullName: safeStr(() => u.fullName),
      phoneNumber: safeStr(() => u.phoneNumber),
      email: safeStr(() => u.email),
      city: safeStr(() => u.city),
      userType: safeInt(),
      allowNotify: safeBool(),
      token: safeToken(),
      profileImageRelative: safeStr(() => u.profileImageRelative),
      inviteCode: safeStr(() => u.inviteCode),
      sessionExpiry: safeStr(() => u.sessionExpiry),
    );
  }

  static String _dynStr(Object? v) {
    if (v == null) return '';
    if (v is String) return v;
    final s = v.toString();
    return s == 'null' ? '' : s;
  }

  UserModel copyWith({
    String? id,
    String? fullName,
    String? phoneNumber,
    String? email,
    String? city,
    int? userType,
    bool? allowNotify,
    String? token,
    String? profileImageRelative,
    String? inviteCode,
    String? sessionExpiry,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      city: city ?? this.city,
      userType: userType ?? this.userType,
      allowNotify: allowNotify ?? this.allowNotify,
      token: token ?? this.token,
      profileImageRelative: profileImageRelative ?? this.profileImageRelative,
      inviteCode: inviteCode ?? this.inviteCode,
      sessionExpiry: sessionExpiry ?? this.sessionExpiry,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: _dynStr(json['id']),
    fullName: _dynStr(json['fullName']),
    phoneNumber: _dynStr(json['phoneNumber']),
    email: _dynStr(json['email']),
    city: _dynStr(json['city']),
    userType: _parseInt(json['userType']),
    allowNotify: json['allowNotify'] == true,
    token: json['token'] != null ? _dynStr(json['token']) : null,
    profileImageRelative: _dynStr(json['profileImageRelative']),
    inviteCode: _dynStr(json['inviteCode']),
    sessionExpiry: _dynStr(json['sessionExpiry']),
  );

  static int _parseInt(Object? v) {
    if (v is int) return v;
    return int.tryParse(v?.toString() ?? '') ?? 0;
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullName": fullName,
    "phoneNumber": phoneNumber,
    "email": email,
    "city": city,
    "userType": userType,
    "allowNotify": allowNotify,
    if (token != null) "token": token,
    "profileImageRelative": profileImageRelative,
    "inviteCode": inviteCode,
    "sessionExpiry": sessionExpiry,
  };
}
