import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/entities/profile_entity.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/cubit/edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit()
      : super(EditProfileState(
          status: EditProfileRequestStatus.loading,
        ));

  Future<void> loadProfile() async {
    emit(state.copyWith(status: EditProfileRequestStatus.loading));

    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final profile = ProfileEntity(
        id: 1,
        name: 'أحمد بن حماد',
        phone: '+966 55 123 4567',
        email: 'ahmed@example.com',
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHLt1Maa11qirS2kVC4ylQI3mZU9EyrpMj0Oe7b-kPHA&s=10',
      );
      emit(state.copyWith(
        status: EditProfileRequestStatus.success,
        profile: profile,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: EditProfileRequestStatus.failure,
        error: e.toString(),
      ));
    }
  }

  // Future<void> pickImage() async {
  //   final picker = ImagePicker();
  //   final picked = await picker.pickImage(source: ImageSource.gallery);
  //   if (picked != null) {
  //     emit(state.copyWith(pickedImagePath: picked.path));
  //   }
  // }

  // Future<void> uploadImage() async {
  //   final picker = ImagePicker();
  //   final picked = await picker.pickImage(source: ImageSource.gallery);
  //   if (picked == null) return;
  //
  //   emit(state.copyWith(status: EditProfileRequestStatus.loading));
  //
  //   try {
  //     await Future.delayed(const Duration(seconds: 1));
  //     final updated = ProfileEntity(
  //       id: state.profile?.id ?? 0,
  //       name: state.profile?.name ?? '',
  //       phone: state.profile?.phone ?? '',
  //       email: state.profile?.email,
  //       image: picked.path,
  //     );
  //     emit(state.copyWith(
  //       status: EditProfileRequestStatus.success,
  //       profile: updated,
  //       pickedImagePath: picked.path,
  //     ));
  //   } catch (e) {
  //     emit(state.copyWith(
  //       status: EditProfileRequestStatus.failure,
  //       error: e.toString(),
  //     ));
  //   }
  // }

  Future<void> updateProfile({
    required String name,
    required String phone,
    String? image,
  }) async {
    emit(state.copyWith(status: EditProfileRequestStatus.loading));

    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final updated = ProfileEntity(
        id: state.profile?.id ?? 0,
        name: name,
        phone: phone,
        email: state.profile?.email,
        image: image ?? state.profile?.image,
      );
      emit(state.copyWith(
        status: EditProfileRequestStatus.success,
        profile: updated,
        pickedImagePath: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: EditProfileRequestStatus.failure,
        error: e.toString(),
      ));
    }
  }
}
