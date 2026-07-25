import 'dart:async';
// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/auth/login_screen.dart';
import 'package:scraapy_pro/authentication/presentation/cubits/login_cubit.dart';
import 'package:scraapy_pro/authentication/presentation/widgets/auth_text_field.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/core/di/injection.dart';
import 'package:scraapy_pro/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:scraapy_pro/screens/home/presentation/screens/home_screen.dart';

class OtpLoginScreen extends StatefulWidget {
  const OtpLoginScreen({
    super.key,
    required this.displayPhone,
    required this.loginType,
    required this.rawIdentifier,
  });

  final String displayPhone;
  final LoginType loginType;
  final String rawIdentifier;

  @override
  State<OtpLoginScreen> createState() => _OtpLoginScreenState();
}

class _OtpLoginScreenState extends State<OtpLoginScreen> {
  final _otpKey = GlobalKey<OtpInputRowState>();
  int _remaining = 30;
  bool _canResend = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    setState(() {
      _remaining = 30;
      _canResend = false;
    });
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) { t.cancel(); return; }
      setState(() {
        if (_remaining > 0) {
          _remaining--;
        } else {
          _canResend = true;
          t.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _submit(String code) {
    if (code.length != 6) return;
    context.read<LoginCubit>().verifyOtp(
      identifier: widget.rawIdentifier,
      code: code,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state.status == LoginStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage), backgroundColor: Colors.red),
            // SnackBar(content: Text(state.errorMessage.tr()), backgroundColor: Colors.red),
          );
          context.read<LoginCubit>().resetError();
        }
        if (state.status == LoginStatus.success) {
          // Set the token on the Dio client immediately for this session.
          await getIt<UserCubit>().init();
          if (!context.mounted) return;
          final dest = state.userType == 'individual'
              // ? const NotAllowedScreen()
              // : const MainShellScreen();
        ? const LoginScreen()
            : const HomeScreen();
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute<void>(builder: (_) => dest),
            (_) => false,
          );
        }
      },
      child: Container(
        // decoration: BoxDecoration(gradient: AppColors.scrappyGradient),
        decoration: BoxDecoration(gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.terquaz,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: const IconThemeData(color: AppColors.white),
            title: Text('verifyOtp', style: const TextStyle(color: AppColors.white)),
            // title: Text('verifyOtp'.tr(), style: const TextStyle(color: AppColors.white)),
          ),
          body: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              final isVerifying = state.status == LoginStatus.verifying;
              return SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      Text(
                        'verificationSentPhone',
                        // 'verificationSentPhone'.tr(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: AppColors.white, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.displayPhone,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 32),
                      OtpInputRow(
                        key: _otpKey,
                        onCompleted: _submit,
                      ),
                      const SizedBox(height: 24),
                      if (_canResend)
                        TextButton(
                          onPressed: () {
                            _startTimer();
                            context.read<LoginCubit>().sendOtp(identifier: widget.rawIdentifier);
                          },
                          child: Text('resendCode', style: const TextStyle(color: AppColors.white)),
                          // child: Text('resendCode'.tr(), style: const TextStyle(color: AppColors.white)),
                        )
                      else
                        Text(
                          'resendAvailableInAll',
                          // 'resendAvailableInAll'.tr(args: ['$_remaining']),
                          style: const TextStyle(color: AppColors.grey),
                        ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: OutlinedButton(
                          onPressed: isVerifying
                              ? null
                              : () {
                                  final code = _otpKey.currentState?.code ?? '';
                                  _submit(code);
                                },
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            side: const BorderSide(color: AppColors.white),
                          ),
                          child: isVerifying
                              // ? Image.asset('assets/icons/loading.gif', width: 40, height: 40)
                              ? CircularProgressIndicator(color: AppColors.white,strokeWidth: 1.2,)
                              : Text('verify', style: const TextStyle(color: AppColors.white, fontSize: 16)),
                              // : Text('verify'.tr(), style: const TextStyle(color: AppColors.white, fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
