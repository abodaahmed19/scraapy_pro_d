import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:scraapy_pro/auth/login_screen.dart';
import 'package:scraapy_pro/authentication/domain/use_cases/register_use_case.dart';
import 'package:scraapy_pro/authentication/domain/use_cases/send_verification_code_use_case.dart';
import 'package:scraapy_pro/authentication/presentation/cubits/register_cubit.dart';
import 'package:scraapy_pro/authentication/presentation/screens/login_screen.dart';
import 'package:scraapy_pro/authentication/presentation/widgets/auth_text_field.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/core/di/injection.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(
        sendVerificationCodeUseCase: getIt<SendVerificationCodeUseCase>(),
        verifyVerificationCodeUseCase: getIt<VerifyVerificationCodeUseCase>(),
        registerUseCase: getIt<RegisterUseCase>(),
      ),
      child: const _RegisterViewV2(),
    );
  }
}

class _RegisterViewV2 extends StatefulWidget {
  const _RegisterViewV2();

  @override
  State<_RegisterViewV2> createState() => _RegisterViewV2State();
}

class _RegisterViewV2State extends State<_RegisterViewV2> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _inviteCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _inviteCtrl.dispose();
    super.dispose();
  }

  String get _e164Phone => '+966${_phoneCtrl.text.substring(1)}';

  void _requestVerification(RegisterCubit cubit) {
    if (_phoneCtrl.text.length != 10 || !_phoneCtrl.text.startsWith('05')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('mustPhoneFirst'.tr())),
      );
      return;
    }
    cubit.sendVerificationCode(_e164Phone);
    _showOtpDialog(cubit);
  }

  void _showOtpDialog(RegisterCubit cubit) {
    final otpKey = GlobalKey<OtpInputRowState>();
    int countdown = 30;
    bool canResend = false;
    Timer? timer;

    void startTimer(StateSetter setDialogState) {
      countdown = 30;
      canResend = false;
      timer?.cancel();
      timer = Timer.periodic(const Duration(seconds: 1), (t) {
        if (countdown > 0) {
          setDialogState(() => countdown--);
        } else {
          setDialogState(() => canResend = true);
          t.cancel();
        }
      });
    }

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogCtx) => StatefulBuilder(
        builder: (_, setDialogState) {
          if (timer == null) startTimer(setDialogState);

          return BlocProvider.value(
            value: cubit,
            child: AlertDialog(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              title: Text('checkPhone'.tr(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: AppColors.white)),
              content: SingleChildScrollView(
                child: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('verificationSentPhone'.tr(),
                          style: const TextStyle(color: AppColors.white)),
                      Text(_phoneCtrl.text,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: AppColors.white)),
                      const SizedBox(height: 20),
                      OtpInputRow(key: otpKey, onCompleted: (_) {}),
                      const SizedBox(height: 12),
                      canResend
                          ? TextButton(
                              onPressed: () {
                                startTimer(setDialogState);
                                cubit.sendVerificationCode(_e164Phone);
                              },
                              child: Text('resendCode'.tr(),
                                  style: const TextStyle(color: AppColors.white)),
                            )
                          : Text(
                              'resendAvailableInAll'.tr(args: [countdown.toString()]),
                              style: const TextStyle(color: AppColors.grey),
                            ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () { timer?.cancel(); Navigator.of(dialogCtx).pop(); },
                  child: Text('cancel'.tr(), style: const TextStyle(color: AppColors.white)),
                ),
                OutlinedButton(
                  onPressed: () async {
                    final code = otpKey.currentState?.code ?? '';
                    if (code.length == 6) {
                      await cubit.verifyPhone(_e164Phone, code);
                      if (!mounted) return;
                      final s = cubit.state;
                      if (s.isPhoneVerified) {
                        timer?.cancel();
                        if (dialogCtx.mounted) Navigator.of(dialogCtx).pop();
                      } else if (s.status == RegisterStatus.error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(s.errorMessage.tr()),
                            backgroundColor: Colors.red,
                          ),
                        );
                        cubit.resetError();
                      }
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    side: const BorderSide(color: AppColors.white),
                  ),
                  child: Text('verify'.tr(),
                      style: const TextStyle(color: AppColors.white)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _submit(RegisterCubit cubit, RegisterState state) async {
    if (!state.isPhoneVerified) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('mustVerifyPhone'.tr()), backgroundColor: Colors.red),
      );
      return;
    }
    if (!_formKey.currentState!.validate()) return;
    await cubit.register(
      name: _nameCtrl.text,
      email: _emailCtrl.text,
      phone: _e164Phone,
      inviteCode: _inviteCtrl.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, //

      child: Container(
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
          body: BlocListener<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state.status == RegisterStatus.error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage.tr()),
                    backgroundColor: Colors.red,
                  ),
                );
                context.read<RegisterCubit>().resetError();
              }
              if (state.status == RegisterStatus.success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('doneCreateAccount'.tr())),
                );
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute<void>(builder: (_) => const LoginScreen()),
                  (_) => false,
                );
              }
            },
            child: BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                final cubit = context.read<RegisterCubit>();
                final isSubmitting = state.status == RegisterStatus.submitting;

                return SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.sizeOf(context).width > 600 ? 600 : double.infinity,
                            ),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'createAccount'.tr(),
                                    style: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 24),

                                  Container(
                                    padding: const EdgeInsets.all(24),
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withValues(alpha: 0.05),
                                          blurRadius: 20,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        _FieldLabel('fullName'),
                                        const SizedBox(height: 6),
                                        _AltAuthField(
                                          controller: _nameCtrl,
                                          hint: 'fullNameD'.tr(),
                                          icon: Icons.person_outline,
                                          validator: (v) => (v == null || v.isEmpty) ? 'mustFullName'.tr() : null,
                                        ),
                                        const SizedBox(height: 18),

                                        _FieldLabel('email'),
                                        const SizedBox(height: 6),
                                        _AltAuthField(
                                          controller: _emailCtrl,
                                          hint: 'emailD'.tr(),
                                          icon: Icons.email_outlined,
                                          keyboardType: TextInputType.emailAddress,
                                          validator: (v) {
                                            if (v == null || v.isEmpty) return 'mustEmail'.tr();
                                            final ok = RegExp(
                                              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                                            ).hasMatch(v);
                                            return ok ? null : 'mustValidateEmail'.tr();
                                          },
                                        ),
                                        const SizedBox(height: 18),

                                        _FieldLabel('phone'),
                                        const SizedBox(height: 6),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: _AltAuthField(
                                                controller: _phoneCtrl,
                                                hint: 'phoneD'.tr(),
                                                icon: Icons.phone_android_outlined,
                                                keyboardType: TextInputType.phone,
                                                validator: (v) {
                                                  if (v == null || v.isEmpty) return 'mustPhone'.tr();
                                                  if (v.length != 10) return 'mustPhone10'.tr();
                                                  if (!v.startsWith('05')) return 'mustPhone05'.tr();
                                                  return null;
                                                },
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            SizedBox(
                                              height: 52,
                                              child: OutlinedButton(
                                                onPressed: () => _requestVerification(cubit),
                                                style: OutlinedButton.styleFrom(
                                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                                  side: BorderSide(
                                                    color: state.isPhoneVerified ? Colors.greenAccent : AppColors.primary,
                                                  ),
                                                ),
                                                child: Text(
                                                  state.isPhoneVerified ? '✓' : 'verify'.tr(),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: state.isPhoneVerified ? Colors.greenAccent : AppColors.primary,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        if (state.isPhoneVerified)
                                          Padding(
                                            padding: const EdgeInsets.only(top: 6),
                                            child: Text('phoneVerifiedSuccessfully'.tr(),
                                                style: const TextStyle(color: Colors.greenAccent, fontSize: 12, fontWeight: FontWeight.bold)),
                                          ),
                                        const SizedBox(height: 18),

                                        _FieldLabel('invitationCodeO'),
                                        const SizedBox(height: 6),
                                        _AltAuthField(
                                          controller: _inviteCtrl,
                                          hint: 'invitationCodeOD'.tr(),
                                          icon: Icons.confirmation_number_outlined,
                                        ),
                                        const SizedBox(height: 28),

                                        SizedBox(
                                          height: 52,
                                          child: ElevatedButton(
                                            onPressed: isSubmitting ? null : () => _submit(cubit, state),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: AppColors.primary,
                                              foregroundColor: AppColors.white,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                              elevation: 0,
                                            ),
                                            child: isSubmitting
                                                ? const SizedBox(
                                                    width: 24, height: 24,
                                                    child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5),
                                                  )
                                                : Text('createAccount'.tr(),
                                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(height: 24),
                                  Row(children: [
                                    const Expanded(child: Divider(color: AppColors.grey)),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Text('or'.tr(),
                                          style: TextStyle(color: AppColors.white.withValues(alpha: 0.6))),
                                    ),
                                    const Expanded(child: Divider(color: AppColors.grey)),
                                  ]),
                                  const SizedBox(height: 20),

                                  SizedBox(
                                    height: 50,
                                    child: OutlinedButton(
                                      onPressed: () => Navigator.of(context).pushReplacement(
                                        MaterialPageRoute<void>(builder: (_) => const ScrappyLoginScreen()),
                                      ),
                                      style: OutlinedButton.styleFrom(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                        side: BorderSide(color: AppColors.white.withValues(alpha: 0.4)),
                                      ),
                                      child: Text('login'.tr(),
                                          style: const TextStyle(color: AppColors.white, fontSize: 16)),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    height: 50,
                                    child: OutlinedButton(
                                      onPressed: () => Navigator.of(context).pop(),
                                      style: OutlinedButton.styleFrom(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                        side: BorderSide(color: AppColors.white.withValues(alpha: 0.4)),
                                      ),
                                      child: Text('guestLogin'.tr(),
                                          style: const TextStyle(color: AppColors.white, fontSize: 16)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.label);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label.tr(),
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
      ),
    );
  }
}

class _AltAuthField extends StatelessWidget {
  const _AltAuthField({
    required this.controller,
    required this.hint,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: AppColors.primary,
      style: const TextStyle(color: AppColors.primary),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: AppColors.primary.withValues(alpha: 0.4)),
        prefixIcon: Icon(icon, color: AppColors.primary.withValues(alpha: 0.6), size: 22),
        filled: true,
        fillColor: AppColors.background,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
        ),
      ),
      validator: validator,
    );
  }
}
