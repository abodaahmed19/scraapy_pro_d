import 'package:scraapy_pro/screens/profile/acount_info/domain/entities/profile_entity.dart';

enum EditProfileRequestStatus { loading, success, failure }

class EditProfileState {
  final EditProfileRequestStatus status;
  final ProfileEntity? profile;
  final String? error;
  final String? pickedImagePath;

  EditProfileState({
    required this.status,
    this.profile,
    this.error,
    this.pickedImagePath,
  });

  EditProfileState copyWith({
    EditProfileRequestStatus? status,
    ProfileEntity? profile,
    String? error,
    String? pickedImagePath,
  }) {
    return EditProfileState(
      status: status ?? this.status,
      profile: profile ?? this.profile,
      error: error ?? this.error,
      pickedImagePath: pickedImagePath ?? this.pickedImagePath,
    );
  }
}
