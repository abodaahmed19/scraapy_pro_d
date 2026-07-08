import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/app_cubit.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const ScraapyProApp());
}

class ScraapyProApp extends StatelessWidget {
  const ScraapyProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp(
        title: 'Scraapy Pro',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Cairo', 
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
