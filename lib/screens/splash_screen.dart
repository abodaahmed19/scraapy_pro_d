// import 'package:flutter/material.dart';
// import 'onboarding_screen.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
//
// class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     )..forward();
//     _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
//
//     Future.delayed(const Duration(seconds: 3), () {
//       if (!mounted) return;
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const OnboardingScreen()),
//       );
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.primary,
//       body: Center(
//         child: FadeTransition(
//           opacity: _animation,
//           child: const Text(
//             'سكرابي برو',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 48,
//               fontWeight: FontWeight.bold,
//               letterSpacing: 2.0,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
