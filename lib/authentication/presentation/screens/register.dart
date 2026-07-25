import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/auth/login_screen.dart';
import 'package:scraapy_pro/authentication/domain/use_cases/register_use_case.dart';
import 'package:scraapy_pro/authentication/domain/use_cases/send_verification_code_use_case.dart';
import 'package:scraapy_pro/authentication/presentation/cubits/register_cubit.dart';
import 'package:scraapy_pro/authentication/presentation/widgets/auth_text_field.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/core/di/injection.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(
        sendVerificationCodeUseCase: getIt<SendVerificationCodeUseCase>(),
        verifyVerificationCodeUseCase: getIt<VerifyVerificationCodeUseCase>(),
        registerUseCase: getIt<RegisterUseCase>(),
      ),
      child: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatefulWidget {
  const _RegisterView();

  @override
  State<_RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<_RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _inviteCtrl = TextEditingController();
  // late final NotchBottomBarController _notchController;

  @override
  void initState() {
    super.initState();
    // _notchController = NotchBottomBarController(index: -2);
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _inviteCtrl.dispose();
    // _notchController.dispose();
    super.dispose();
  }


  String get _e164Phone => '+966${_phoneCtrl.text.substring(1)}';

  void _requestVerification(RegisterCubit cubit) {
    if (_phoneCtrl.text.length != 10 || !_phoneCtrl.text.startsWith('05')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('mustPhoneFirst')),
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
          // start timer on first build
          if (timer == null) startTimer(setDialogState);

          return BlocProvider.value(
            value: cubit,
            child: AlertDialog(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              title: Text('checkPhone',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: AppColors.white)),
              content: SingleChildScrollView(
                child: SizedBox(
                  width: double.maxFinite,

                  child: Column(

                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('verificationSentPhone',
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
                        child: Text('resendCode',
                            style: const TextStyle(color: AppColors.white)),
                      )
                          : Text(
                        'resendAvailableInAll',
                        style: const TextStyle(color: AppColors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () { timer?.cancel(); Navigator.of(dialogCtx).pop(); },
                  child: Text('cancel', style: const TextStyle(color: AppColors.white)),
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
                            content: Text(s.errorMessage),
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
                  child: Text('verify',
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
        SnackBar(content: Text('mustVerifyPhone'), backgroundColor: Colors.red),
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
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(
        colors: [
          AppColors.primary,
          AppColors.terquaz,
          // end color
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
                  content: Text(state.errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
              context.read<RegisterCubit>().resetError();
            }
            if (state.status == RegisterStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('doneCreateAccount')),
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
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.sizeOf(context).width > 600 ? 600 : double.infinity,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 50),
                          Align(
                            child: SvgPicture.asset('assets/images/scraapy.svg', height: 90, width: 90),
                          ),
                          const SizedBox(height: 24),

                          // Full name
                          Text('fullName', style: const TextStyle(fontSize: 14, color: AppColors.white)),
                          const SizedBox(height: 8),
                          AuthTextField(
                            controller: _nameCtrl,
                            labelKey: 'fullNameD',
                            validator: (v) => (v == null || v.isEmpty) ? 'mustFullName' : null,
                          ),
                          const SizedBox(height: 16),

                          // Email
                          Text('email', style: const TextStyle(fontSize: 14, color: AppColors.white)),
                          const SizedBox(height: 8),
                          AuthTextField(
                            controller: _emailCtrl,
                            labelKey: 'emailD',
                            keyboardType: TextInputType.emailAddress,
                            validator: (v) {
                              if (v == null || v.isEmpty) return 'mustEmail';
                              final ok = RegExp(
                                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                              ).hasMatch(v);
                              return ok ? null : 'mustValidateEmail';
                            },
                          ),
                          const SizedBox(height: 16),

                          // Phone + verify button
                          Text('phone', style: const TextStyle(fontSize: 14, color: AppColors.white)),
                          const SizedBox(height: 8),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: AuthTextField(
                                  controller: _phoneCtrl,
                                  labelKey: 'phoneD',
                                  keyboardType: TextInputType.phone,
                                  validator: (v) {
                                    if (v == null || v.isEmpty) return 'mustPhone';
                                    if (v.length != 10) return 'mustPhone10';
                                    if (!v.startsWith('05')) return 'mustPhone05';
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 8),
                              OutlinedButton(
                                onPressed: () => _requestVerification(cubit),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  side: const BorderSide(color: AppColors.white),
                                ),
                                child: Text(
                                  state.isPhoneVerified ? '✓' : 'verify',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: state.isPhoneVerified ? Colors.greenAccent : AppColors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (state.isPhoneVerified)
                            Padding(
                              padding: const EdgeInsets.only(top: 6, right: 8, left: 8),
                              child: Text('phoneVerifiedSuccessfully',
                                  style: const TextStyle(color: Colors.greenAccent, fontSize: 12, fontWeight: FontWeight.bold)),
                            ),
                          const SizedBox(height: 16),

                          // Invite code (optional)
                          Text('invitationCodeO', style: const TextStyle(fontSize: 14, color: AppColors.white)),
                          const SizedBox(height: 8),
                          AuthTextField(
                            controller: _inviteCtrl,
                            labelKey: 'invitationCodeOD',
                          ),
                          const SizedBox(height: 32),

                          // Submit
                          SizedBox(
                            height: 50,
                            child: OutlinedButton(
                              onPressed: isSubmitting ? null : () => _submit(cubit, state),
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                side: const BorderSide(color: AppColors.white),
                              ),
                              child: isSubmitting
                                  ? Image.asset('assets/icons/loading.gif', width: 40, height: 40)
                                  : Text('createAccount',
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.white)),
                            ),
                          ),
                          const SizedBox(height: 20),

                          Row(children: [
                            const Expanded(child: Divider(color: AppColors.white)),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text('or', style: const TextStyle(color: AppColors.white)),
                            ),
                            const Expanded(child: Divider(color: AppColors.white)),
                          ]),
                          const SizedBox(height: 20),

                          SizedBox(
                            height: 50,
                            child: OutlinedButton(
                              onPressed: () => Navigator.of(context).pushReplacement(
                                MaterialPageRoute<void>(builder: (_) => const LoginScreen()),
                              ),
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                side: const BorderSide(color: AppColors.white),
                              ),
                              child: Text('login', style: const TextStyle(color: AppColors.white, fontSize: 16)),
                            ),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: 50,
                            child: OutlinedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                side: const BorderSide(color: AppColors.white),
                              ),
                              child: Text('guestLogin', style: const TextStyle(color: AppColors.white, fontSize: 16)),
                            ),
                          ),
                        ],
                      ),
                    ),
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
