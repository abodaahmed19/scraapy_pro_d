import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/authentication/domain/use_cases/register_use_case.dart';
import 'package:scraapy_pro/authentication/domain/use_cases/send_verification_code_use_case.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({
    required this.sendVerificationCodeUseCase,
    required this.verifyVerificationCodeUseCase,
    required this.registerUseCase,
  }) : super(const RegisterState());

  final SendVerificationCodeUseCase sendVerificationCodeUseCase;
  final VerifyVerificationCodeUseCase verifyVerificationCodeUseCase;
  final RegisterUseCase registerUseCase;

  /// Step 1: send phone verification code (for phone field in the form).
  Future<void> sendVerificationCode(String phone) async {
    emit(state.copyWith(status: RegisterStatus.sendingCode, errorMessage: ''));
    final result = await sendVerificationCodeUseCase(phone);
    result.when(
      (_) => emit(state.copyWith(status: RegisterStatus.codeSent)),
      (failure) => emit(
        state.copyWith(
          status: RegisterStatus.error,
          errorMessage: 'failedSendCode',
        ),
      ),
    );
  }

  /// Step 2: verify phone OTP entered in the popup.
  Future<void> verifyPhone(String phone, String otp) async {
    emit(
      state.copyWith(status: RegisterStatus.verifyingPhone, errorMessage: ''),
    );
    final result = await verifyVerificationCodeUseCase(
      VerifyVerificationCodeParams(phone: phone, otp: otp),
    );
    result.when(
      (ok) {
        if (ok) {
          emit(
            state.copyWith(
              status: RegisterStatus.phoneVerified,
              isPhoneVerified: true,
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: RegisterStatus.error,
              errorMessage: 'notVerified',
            ),
          );
        }
      },
      (failure) => emit(
        state.copyWith(status: RegisterStatus.error, errorMessage: 'unknown'),
      ),
    );
  }

  /// Step 3: submit registration.
  Future<void> register({
    required String name,
    required String email,
    required String phone,
    required String inviteCode,
  }) async {
    emit(state.copyWith(status: RegisterStatus.submitting, errorMessage: ''));
    final result = await registerUseCase(
      RegisterParams(
        name: name,
        email: email,
        phone: phone,
        inviteCode: inviteCode,
      ),
    );
    result.when(
      (code) {
        if (code == 200) {
          emit(state.copyWith(status: RegisterStatus.success));
        } else if (code == 600) {
          emit(
            state.copyWith(
              status: RegisterStatus.error,
              errorMessage: 'emailPhoneExists',
            ),
          );
        } else if (code == 601) {
          emit(
            state.copyWith(
              status: RegisterStatus.error,
              errorMessage: 'emailExists',
            ),
          );
        } else if (code == 602) {
          emit(
            state.copyWith(
              status: RegisterStatus.error,
              errorMessage: 'phoneExists',
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: RegisterStatus.error,
              errorMessage: 'somethingWentWrong',
            ),
          );
        }
      },
      (failure) => emit(
        state.copyWith(
          status: RegisterStatus.error,
          errorMessage: 'somethingWentWrong',
        ),
      ),
    );
  }

  void resetError() {
    emit(
      state.copyWith(
        status: state.isPhoneVerified
            ? RegisterStatus.phoneVerified
            : RegisterStatus.initial,
        errorMessage: '',
      ),
    );
  }
}
