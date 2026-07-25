part of 'login_cubit.dart';

enum LoginStatus { initial, loading, otpSent, verifying, success, error }

/// Login identifier type — phone or email.
enum LoginType { phone, email }

class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.initial,
    this.loginType = LoginType.phone,
    this.sentToPhone = '',
    this.userType = '',
    this.errorMessage = '',
  });

  final LoginStatus status;
  final LoginType loginType;

  /// Normalised phone shown on the OTP screen (e.g. "0501234567").
  final String sentToPhone;

  /// Returned by verifyOtp — used to route to NotAllowed if "individual".
  final String userType;
  final String errorMessage;

  LoginState copyWith({
    LoginStatus? status,
    LoginType? loginType,
    String? sentToPhone,
    String? userType,
    String? errorMessage,
  }) {
    return LoginState(
      status: status ?? this.status,
      loginType: loginType ?? this.loginType,
      sentToPhone: sentToPhone ?? this.sentToPhone,
      userType: userType ?? this.userType,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [status, loginType, sentToPhone, userType, errorMessage];
}
