import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/authentication/domain/use_cases/send_otp_use_case.dart';
import 'package:scraapy_pro/authentication/domain/use_cases/verify_otp_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.sendOtpUseCase,
    required this.verifyOtpUseCase,
  }) : super(const LoginState());

  final SendOtpUseCase sendOtpUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;

  void setLoginType(LoginType type) {
    emit(
      state.copyWith(
        loginType: type,
        status: LoginStatus.initial,
        errorMessage: '',
      ),
    );
  }

  /// Step 1: send OTP to phone (+966XXXXXXXXX) or email.
  Future<void> sendOtp({required String identifier}) async {
    emit(state.copyWith(status: LoginStatus.loading, errorMessage: ''));
    final result = await sendOtpUseCase(identifier);
    result.when(
      (data) {
        final displayPhone = data.phone.startsWith('+966')
            ? '0${data.phone.substring(4)}'
            : data.phone;
        emit(
          state.copyWith(
            status: LoginStatus.otpSent,
            sentToPhone: displayPhone,
          ),
        );
      },
      (failure) => emit(
        state.copyWith(
          status: LoginStatus.error,
          errorMessage: failure.message,
        ),
      ),
    );
  }

  /// Step 2: verify the 6-digit OTP and complete login.
  Future<void> verifyOtp({
    required String identifier,
    required String code,
  }) async {
    emit(state.copyWith(status: LoginStatus.verifying, errorMessage: ''));
    final result = await verifyOtpUseCase(
      VerifyOtpParams(identifier: identifier, code: code),
    );
    result.when(
      (userType) =>
          emit(state.copyWith(status: LoginStatus.success, userType: userType)),
      (failure) => emit(
        state.copyWith(
          status: LoginStatus.error,
          errorMessage: 'invalidExpiredCode',
        ),
      ),
    );
  }

  void resetError() {
    emit(state.copyWith(status: LoginStatus.initial, errorMessage: ''));
  }
}
