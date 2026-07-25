// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:scraapy_pro/const/app_colors.dart';
// import 'package:scraapypro/src/config/res/color_manager.dart';
// import 'package:scraapypro/src/core/navigation/navigator.dart';
// import 'package:scraapypro/src/features/marketplace/presentation/marketplace_placeholder_screen.dart';
// import 'package:scraapypro/src/features/onboarding/cubit/not_allowed_cubit.dart';
//
// class NotAllowedScreen extends StatelessWidget {
//   const NotAllowedScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => NotAllowedCubit(),
//       child: const _NotAllowedView(),
//     );
//   }
// }
//
// class _NotAllowedView extends StatelessWidget {
//   const _NotAllowedView();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<NotAllowedCubit, NotAllowedState>(
//       listener: (context, state) {
//         if (state is NotAllowedLogoutSuccess) {
//           Go.offAll(const MarketplacePlaceholderScreen(type: 'marketplace'));
//         }
//         if (state is NotAllowedLogoutFailure) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(state.message)),
//           );
//         }
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           // gradient: AppColors.scrappyGradient,
//         ),
//         child: Scaffold(
//           backgroundColor: Colors.transparent,
//           body: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(24),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(Icons.lock_outline, size: 100, color: Colors.redAccent),
//                   const SizedBox(height: 20),
//                   Text(
//                     'accessDenied'.tr(),
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     'accessDeniedD'.tr(),
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       color: AppColors.white70,
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                   BlocBuilder<NotAllowedCubit, NotAllowedState>(
//                     builder: (context, state) {
//                       final loading = state is NotAllowedLogoutLoading;
//                       return ElevatedButton.icon(
//                         onPressed: loading
//                             ? null
//                             : () => context.read<NotAllowedCubit>().logout(),
//                         icon: const Icon(Icons.logout, color: AppColors.white),
//                         label: Text(
//                           'logout'.tr(),
//                           style: const TextStyle(color: AppColors.white),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(
//                             vertical: 16,
//                             horizontal: 10,
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           side: const BorderSide(color: AppColors.white),
//                           backgroundColor: Colors.transparent,
//                           foregroundColor: AppColors.white,
//                           elevation: 0,
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
