
class BranchesEntity {
  final int count;
  final String? next;
  final String? previous;
  final List<BranchEntity> results;

  BranchesEntity({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory BranchesEntity.fromJson(Map<String, dynamic> json) {
    return BranchesEntity(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => BranchEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results.map((e) => e.toJson()).toList(),
    };
  }
}
class BranchEntity {
  final int id;
  final String name;
  final String cityName;
  final String email;
  final String phoneNumber;

  BranchEntity({
    required this.id,
    required this.name,
    required this.cityName,
    required this.email,
    required this.phoneNumber,
  });

  factory BranchEntity.fromJson(Map<String, dynamic> json) {
    return BranchEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      cityName: json['city_name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'city_name': cityName,
      'email': email,
      'phone_number': phoneNumber,
    };
  }
}
