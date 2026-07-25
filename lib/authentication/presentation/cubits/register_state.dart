part of 'register_cubit.dart';

enum RegisterStatus {
  initial,
  sendingCode,
  codeSent,
  verifyingPhone,
  phoneVerified,
  submitting,
  success,
  error,
}

class RegisterState extends Equatable {
  const RegisterState({
    this.status = RegisterStatus.initial,
    this.isPhoneVerified = false,
    this.errorMessage = '',
  });

  final RegisterStatus status;
  final bool isPhoneVerified;
  final String errorMessage;

  RegisterState copyWith({
    RegisterStatus? status,
    bool? isPhoneVerified,
    String? errorMessage,
  }) {
    return RegisterState(
      status: status ?? this.status,
      isPhoneVerified: isPhoneVerified ?? this.isPhoneVerified,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, isPhoneVerified, errorMessage];
}
