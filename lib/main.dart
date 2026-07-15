import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/core/di/injection.dart';
import 'package:scraapy_pro/screens/splash/splash.dart';
import 'cubit/app_cubit.dart';
import 'cubit/theme_cubit.dart';
import 'screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const ScraapyProApp());
}

class ScraapyProApp extends StatelessWidget {
  const ScraapyProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'Scraapy Pro',
            debugShowCheckedModeBanner: false,
            themeMode: themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primaryColor: const Color(0xFF234777),
              scaffoldBackgroundColor: const Color(0xFFF9F9F9),
              fontFamily: 'Cairo',
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                iconTheme: IconThemeData(color: Color(0xFF234777)),
                titleTextStyle: TextStyle(color: Color(0xFF234777), fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
              ),
              colorScheme: const ColorScheme.light(
                primary: Color(0xFF234777),
                secondary: Color(0xFF189491),
                surface: Colors.white,
              ),
              cardTheme: CardThemeData(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Colors.grey.withValues(alpha: 0.2), width: 1),
                ),
                color: Colors.white,
                margin: EdgeInsets.zero,
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF234777),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                )
              ),
              outlinedButtonTheme: OutlinedButtonThemeData(
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF234777),
                  side: const BorderSide(color: Color(0xFF234777)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                )
              ),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: const Color(0xFF234777),
              scaffoldBackgroundColor: const Color(0xFF121212),
              fontFamily: 'Cairo',
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                iconTheme: IconThemeData(color: Colors.white),
                titleTextStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
              ),
              colorScheme: const ColorScheme.dark(
                primary: Color(0xFF4A7CBD),
                secondary: Color(0xFF189491),
                surface: Color(0xFF1E1E1E),
              ),
              cardTheme: CardThemeData(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Colors.white.withValues(alpha: 0.1), width: 1),
                ),
                color: const Color(0xFF1E1E1E),
                margin: EdgeInsets.zero,
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A7CBD),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                )
              ),
            ),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
