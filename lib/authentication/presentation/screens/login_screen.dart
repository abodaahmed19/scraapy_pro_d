import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/authentication/domain/use_cases/send_otp_use_case.dart';
import 'package:scraapy_pro/authentication/domain/use_cases/verify_otp_use_case.dart';
import 'package:scraapy_pro/authentication/presentation/cubits/login_cubit.dart';
import 'package:scraapy_pro/authentication/presentation/screens/otp_login_screen.dart';
import 'package:scraapy_pro/authentication/presentation/screens/register_screen_v2.dart';
import 'package:scraapy_pro/authentication/presentation/widgets/auth_text_field.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/core/di/injection.dart';
import 'package:scraapy_pro/screens/main/main_layout.dart';

class ScrappyLoginScreen extends StatelessWidget {
  const ScrappyLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(
        sendOtpUseCase: getIt<SendOtpUseCase>(),
        verifyOtpUseCase: getIt<VerifyOtpUseCase>(),
      ),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatefulWidget {
  const _LoginView();

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  late final AnimationController _animController;
  late final Animation<double> _formFade;
  late final Animation<Offset> _formSlide;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _formFade = CurvedAnimation(
      parent: _animController,
      curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
    );
    _formSlide = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animController,
      curve: const Interval(0.0, 0.8, curve: Curves.easeOutCubic),
    ));
    _animController.forward();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _emailController.dispose();
    _animController.dispose();
    super.dispose();
  }

  void _sendOtp(LoginCubit cubit, LoginState state) {
    if (!_formKey.currentState!.validate()) return;
    final isPhone = state.loginType == LoginType.phone;
    final identifier = isPhone
        ? '+966${_phoneController.text.substring(1)}'
        : _emailController.text;
    cubit.sendOtp(identifier: identifier);
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
          body: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state.status == LoginStatus.error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage.tr()),
                    backgroundColor: Colors.red,
                  ),
                );
                context.read<LoginCubit>().resetError();
              }
              if (state.status == LoginStatus.otpSent) {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => BlocProvider.value(
                      value: context.read<LoginCubit>(),
                      child: OtpLoginScreen(
                        displayPhone: state.sentToPhone,
                        loginType: state.loginType,
                        rawIdentifier: state.loginType == LoginType.phone
                            ? '+966${_phoneController.text.substring(1)}'
                            : _emailController.text,
                      ),
                    ),
                  ),
                );
              }
            },
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                final cubit = context.read<LoginCubit>();
                final isLoading = state.status == LoginStatus.loading;
                final isPhone = state.loginType == LoginType.phone;

                return SlideTransition(
                  position: _formSlide,
                  child: FadeTransition(
                    opacity: _formFade,
                    child: Align(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth:
                            MediaQuery.sizeOf(context).width > 600 ? 600 : double.infinity,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 50),
                            Image.asset('assets/images/splash.png', height: 200, width: 200),
                            const SizedBox(height: 10),

                            // ── Phone / Email toggle ──
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  _TabToggle(
                                    label: 'phone'.tr(),
                                    selected: isPhone,
                                    onTap: () => cubit.setLoginType(LoginType.phone),
                                  ),
                                  _TabToggle(
                                    label: 'email'.tr(),
                                    selected: !isPhone,
                                    onTap: () => cubit.setLoginType(LoginType.email),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),

                            // ── Input field ──
                            if (isPhone)
                              AuthTextField(
                                controller: _phoneController,
                                labelKey: 'phoneD'.tr(),
                                keyboardType: TextInputType.phone,
                                prefixIcon:
                                    const Icon(Icons.phone_android, color: AppColors.white),
                                validator: (v) {
                                  if (v == null || v.isEmpty) return 'mustPhone'.tr();
                                  if (v.length != 10) return 'mustPhone10'.tr();
                                  if (!v.startsWith('05')) return 'mustPhone05'.tr();
                                  return null;
                                },
                              )
                            else
                              AuthTextField(
                                controller: _emailController,
                                labelKey: 'emailD'.tr(),
                                keyboardType: TextInputType.emailAddress,
                                prefixIcon:
                                    const Icon(Icons.email_outlined, color: AppColors.white),
                                validator: (v) {
                                  if (v == null || v.isEmpty) return 'mustEmail'.tr();
                                  final valid = RegExp(
                                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                                  ).hasMatch(v);
                                  if (!valid) return 'mustValidateEmail'.tr();
                                  return null;
                                },
                              ),
                            const SizedBox(height: 30),

                            // ── Send OTP button ──
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: OutlinedButton(
                                onPressed: isLoading ? null : () => _sendOtp(cubit, state),
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  side: const BorderSide(color: AppColors.white),
                                ),
                                child: isLoading
                                    ? const CircularProgressIndicator(color: AppColors.white,strokeWidth: 1.2,)
                                    : Text(
                                        'login'.tr(),
                                        style: const TextStyle(
                                            fontSize: 16, color: AppColors.white),
                                      ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            _dividerOr(),
                            const SizedBox(height: 20),

                            // ── Register button ──
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute<void>(
                                        builder: (_) => const RegisterScreen()),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  side: const BorderSide(color: AppColors.white),
                                ),
                                child: Text(
                                  'register'.tr(),
                                  style:
                                      const TextStyle(color: AppColors.white, fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),

                            // ── Guest button ──
                            // SizedBox(
                            //   width: double.infinity,
                            //   height: 50,
                            //   child: OutlinedButton(
                            //     // onPressed: () => Navigator.of(context).pop(),
                            //     onPressed: () {
                            //       Navigator.push(context, MaterialPageRoute(builder: (_) =>  MainLayout() ));
                            //
                            //     },
                            //     style: OutlinedButton.styleFrom(
                            //       shape: RoundedRectangleBorder(
                            //           borderRadius: BorderRadius.circular(10)),
                            //       side: const BorderSide(color: AppColors.white),
                            //     ),
                            //     child: Text(
                            //       'guestLogin'.tr(),
                            //       style:
                            //           const TextStyle(color: AppColors.white, fontSize: 16),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )));
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _dividerOr() {
    return Row(
      children: [
        const Expanded(child: Divider(color: AppColors.white)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
              'or'.tr(),
              style: const TextStyle(color: AppColors.white)),
        ),
        const Expanded(child: Divider(color: AppColors.white)),
      ],
    );
  }
}

class _TabToggle extends StatelessWidget {
  const _TabToggle({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: selected ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: selected ? AppColors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
