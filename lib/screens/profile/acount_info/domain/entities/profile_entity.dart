class ProfileEntity {
  final int id;
  final String name;
  final String? email;
  final String phone;
  final String? image;

  ProfileEntity({
    required this.id,
    required this.name,
    this.email,
    required this.phone,
    this.image,
  });

  factory ProfileEntity.fromJson(Map<String, dynamic> json) {
    return ProfileEntity(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
    };
  }
}
