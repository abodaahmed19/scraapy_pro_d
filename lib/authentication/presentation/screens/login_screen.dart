// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/authentication/domain/use_cases/send_otp_use_case.dart';
import 'package:scraapy_pro/authentication/domain/use_cases/verify_otp_use_case.dart';
import 'package:scraapy_pro/authentication/presentation/cubits/login_cubit.dart';
import 'package:scraapy_pro/authentication/presentation/screens/otp_login_screen.dart';
import 'package:scraapy_pro/authentication/presentation/screens/register_screen.dart';
import 'package:scraapy_pro/authentication/presentation/widgets/auth_text_field.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/core/di/injection.dart';

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
  // late final NotchBottomBarController _notchController;
  late final AnimationController _animController;
  late final Animation<double> _formFade;
  late final Animation<Offset> _formSlide;

  @override
  void initState() {
    super.initState();
    // _notchController = NotchBottomBarController(index: -2);
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
    // _notchController.dispose();
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

  // void _selectTab(BuildContext context, int index) {
  //   // Pop back to shell and select the tapped tab
  //   Navigator.of(context).pop();
  //   context.read<MainShellCubit>().selectTab(index);
  // }

  // Widget _buildNotchBar(BuildContext context) {
  //   final size = MediaQuery.sizeOf(context);
  //   final isSmall = size.width < 500;
  //   final locale = context.locale.languageCode;
  //
  //   return AnimatedNotchBottomBar(
  //     key: ValueKey('login_notch_$locale'),
  //     notchBottomBarController: _notchController,
  //     color: AppColors.primary,
  //     notchColor: AppColors.terquaz,
  //     shadowElevation: 5,
  //     kBottomRadius: isSmall ? 20.0 : 28.0,
  //     kIconSize: isSmall ? 20.0 : 24.0,
  //     bottomBarWidth: size.width < 600 ? size.width : 500,
  //     durationInMilliSeconds: 150,
  //     removeMargins: false,
  //     itemLabelStyle: const TextStyle(color: AppColors.white, fontSize: 11),
  //     onTap: (index) => _selectTab(context, index),
  //     bottomBarItems: [
  //       BottomBarItem(
  //         inActiveItem: const Icon(Icons.engineering, color: AppColors.white),
  //         activeItem: const Icon(Icons.engineering_outlined, color: AppColors.white),
  //         itemLabel: 'serviceRequest'.tr(),
  //       ),
  //       BottomBarItem(
  //         inActiveItem: const Icon(Icons.home_work, color: AppColors.white),
  //         activeItem: const Icon(Icons.home_work_outlined, color: AppColors.white),
  //         itemLabel: 'rental'.tr(),
  //       ),
  //       BottomBarItem(
  //         inActiveItem: const Icon(Icons.handyman, color: AppColors.white),
  //         activeItem: const Icon(Icons.handyman_outlined, color: AppColors.white),
  //         itemLabel: 'service'.tr(),
  //       ),
  //       BottomBarItem(
  //         inActiveItem: const Icon(Icons.shopping_bag, color: AppColors.white),
  //         activeItem: const Icon(Icons.shopping_bag_outlined, color: AppColors.white),
  //         itemLabel: 'marketplace'.tr(),
  //       ),
  //     ],
  //   );
  // }

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
      // decoration: BoxDecoration(color: AppColors.primary),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        // bottomNavigationBar: _buildNotchBar(context),
        body: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.status == LoginStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  // content: Text(state.errorMessage.tr()),
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
                          SvgPicture.asset('assets/images/scraapy.svg', height: 90, width: 90),
                          const SizedBox(height: 50),

                          // ── Phone / Email toggle ──
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                _TabToggle(
                                  // label: 'phone'.tr(),
                                  label: 'phone',
                                  selected: isPhone,
                                  onTap: () => cubit.setLoginType(LoginType.phone),
                                ),
                                _TabToggle(
                                  // label: 'email'.tr(),
                                  label: 'email',
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
                              // labelKey: 'phone'.tr(),
                              labelKey: 'phone',
                              keyboardType: TextInputType.phone,
                              prefixIcon:
                                  const Icon(Icons.phone_android, color: AppColors.white),
                              validator: (v) {
                                // if (v == null || v.isEmpty) return 'mustPhone'.tr();
                                // if (v.length != 10) return 'mustPhone10'.tr();
                                // if (!v.startsWith('05')) return 'mustPhone05'.tr();
                                if (v == null || v.isEmpty) return 'mustPhone';
                                if (v.length != 10) return 'mustPhone10';
                                if (!v.startsWith('05')) return 'mustPhone05';
                                return null;
                              },
                            )
                          else
                            AuthTextField(
                              controller: _emailController,
                              labelKey: 'email',
                              // labelKey: 'email'.tr(),
                              keyboardType: TextInputType.emailAddress,
                              prefixIcon:
                                  const Icon(Icons.email_outlined, color: AppColors.white),
                              validator: (v) {
                                if (v == null || v.isEmpty) return 'mustEmail';
                                // if (v == null || v.isEmpty) return 'mustEmail'.tr();
                                final valid = RegExp(
                                  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                                ).hasMatch(v);
                                if (!valid) return 'mustValidateEmail';
                                // if (!valid) return 'mustValidateEmail'.tr();
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
                                  ?
                              // Image.asset(
                              //         'assets/icons/loading.gif',
                              //         width: 110,
                              //         height: 110,
                              //       )
                              CircularProgressIndicator()
                                  : Text(
                                      'login',
                                      // 'login'.tr(),
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
                                print('objectttttt');
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
                                'register',
                                // 'register'.tr(),
                                style:
                                    const TextStyle(color: AppColors.white, fontSize: 16),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),

                          // ── Guest button ──
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: OutlinedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                side: const BorderSide(color: AppColors.white),
                              ),
                              child: Text(
                                'guestLogin',
                                // 'guestLogin'.tr(),
                                style:
                                    const TextStyle(color: AppColors.white, fontSize: 16),
                              ),
                            ),
                          ),
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
    );
  }

  Widget _dividerOr() {
    return Row(
      children: [
        const Expanded(child: Divider(color: AppColors.white)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
              'or',
              // 'or'.tr(),
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
