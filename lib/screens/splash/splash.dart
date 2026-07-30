import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/auth/login_screen.dart';
import 'package:scraapy_pro/authentication/presentation/screens/login_screen.dart';
// import 'package:scraapy_pro/authentication/presentation/screens/login_screen.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/core/di/injection.dart';
import 'package:scraapy_pro/core/helpers/cache_service.dart';
import 'package:scraapy_pro/core/storage/session_storage_keys.dart';
import 'package:scraapy_pro/screens/main/main_layout.dart';
import 'package:scraapy_pro/screens/splash/first_onboarding_screen.dart';
import 'package:scraapy_pro/screens/splash/sec_onboarding.dart' ;
import 'package:scraapy_pro/screens/splash/sec_onboarding.dart' ;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () async{

      final storage = getIt<SecureStorage>();
      final token = await storage.read(SessionStorageKeys.token);

      if(token != null){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainLayout()),
        );
      }else{
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ScrappyLoginScreen()),
        );
      }



    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primary,
              AppColors.terquaz,
              // end color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Image.asset(
            AppImages.splash, // your logo path
            width: 300,
            height: 200,
          ),
        ),
      ),
    );
  }
}