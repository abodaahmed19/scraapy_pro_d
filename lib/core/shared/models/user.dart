class User {
  final int id;
  final SubscriptionModel subscription;
  final String password;
  final DateTime? lastLogin;
  final String userType;
  final String name;
  final String email;
  final String lang;
  final String contactNumber;
  final String pickupAddress;
  final String inviteCode;
  final DateTime? dateJoined;
  final bool isActive;
  final bool isStaff;
  final bool isSuperuser;
  final bool isMawani;
  final bool isTransferInviting;
  final List<int> cities;

  User({
    required this.id,
    required this.subscription,
    required this.password,
    this.lastLogin,
    required this.userType,
    required this.name,
    required this.email,
    required this.lang,
    required this.contactNumber,
    required this.pickupAddress,
    required this.inviteCode,
    this.dateJoined,
    required this.isActive,
    required this.isStaff,
    required this.isSuperuser,
    required this.isMawani,
    required this.isTransferInviting,
    required this.cities,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      subscription: SubscriptionModel.fromJson(
        json['subscription'] as Map<String, dynamic>,
      ),
      password: json['password'] as String,
      lastLogin: json['last_login'] != null
          ? DateTime.parse(json['last_login'] as String)
          : null,
      userType: json['user_type'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      lang: json['lang'] as String,
      contactNumber: json['contact_number'] as String,
      pickupAddress: json['pickup_address'] as String,
      inviteCode: json['invite_code'] as String,
      dateJoined: json['date_joined'] != null
          ? DateTime.parse(json['date_joined'] as String)
          : null,
      isActive: json['is_active'] as bool,
      isStaff: json['is_staff'] as bool,
      isSuperuser: json['is_superuser'] as bool,
      isMawani: json['is_mawani'] as bool,
      isTransferInviting: json['is_transfer_inviting'] as bool,
      cities: List<int>.from(json['cities'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'subscription': subscription.toJson(),
      'password': password,
      'last_login': lastLogin?.toIso8601String(),
      'user_type': userType,
      'name': name,
      'email': email,
      'lang': lang,
      'contact_number': contactNumber,
      'pickup_address': pickupAddress,
      'invite_code': inviteCode,
      'date_joined': dateJoined?.toIso8601String(),
      'is_active': isActive,
      'is_staff': isStaff,
      'is_superuser': isSuperuser,
      'is_mawani': isMawani,
      'is_transfer_inviting': isTransferInviting,
      'cities': cities,
    };
  }
}

class SubscriptionModel {
  final bool isSubscribed;

  SubscriptionModel({
    required this.isSubscribed,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      isSubscribed: json['is_subscribed'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'is_subscribed': isSubscribed,
    };
  }
}