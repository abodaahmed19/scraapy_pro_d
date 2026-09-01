class AddressesResponseEntity {
  final String message;
  final List<AddressEntity> data;
  final List<dynamic> errors;
  final List<dynamic> warnings;

  const AddressesResponseEntity({
    required this.message,
    required this.data,
    required this.errors,
    required this.warnings,
  });

  factory AddressesResponseEntity.fromJson(Map<String, dynamic> json) {
    return AddressesResponseEntity(
      message: json['message'] as String,
      data: (json['data'] as List)
          .map(
            (item) => AddressEntity.fromJson(
          item as Map<String, dynamic>,
        ),
      )
          .toList(),
      errors: json['errors'] ?? [],
      warnings: json['warnings'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data.map((item) => item.toJson()).toList(),
      'errors': errors,
      'warnings': warnings,
    };
  }
}

class AddressEntity {
  final int id;
  final String name;
  final String addressLine1;
  final String? addressLine2;
  final String city;
  final String province;
  final String zipCode;
  final String country;
  final String longitude;
  final String latitude;
  final String? onSiteContactName;
  final String? onSiteContactPhone;
  final int user;
  final bool? is_default;

  const AddressEntity({
    required this.id,
    required this.name,
    required this.addressLine1,
    this.addressLine2,
    required this.city,
    required this.province,
    required this.zipCode,
    required this.country,
    required this.longitude,
    required this.latitude,
    this.onSiteContactName,
    this.onSiteContactPhone,
    required this.user,
    this.is_default,
  });

  factory AddressEntity.fromJson(Map<String, dynamic> json) {
    return AddressEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      addressLine1: json['address_line1'] as String,
      addressLine2: json['address_line2'] as String?,
      city: json['city'] as String,
      province: json['province'] as String,
      zipCode: json['zip_code'] as String,
      country: json['country'] as String,
      longitude: json['longitude'] as String,
      latitude: json['latitude'] as String,
      onSiteContactName: json['on_site_contact_name'] as String?,
      onSiteContactPhone: json['on_site_contact_phone'] as String?,
      user: json['user'] as int,
      is_default: json['is_default'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address_line1': addressLine1,
      'address_line2': addressLine2,
      'city': city,
      'province': province,
      'zip_code': zipCode,
      'country': country,
      'longitude': longitude,
      'latitude': latitude,
      'on_site_contact_name': onSiteContactName,
      'on_site_contact_phone': onSiteContactPhone,
      'user': user,
      'is_default': is_default,
    };
  }
}