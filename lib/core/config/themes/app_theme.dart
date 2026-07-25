// import 'package:flutter/material.dart';
// import 'package:scraapypro/src/config/res/app_sizes.dart';
// import 'package:scraapypro/src/core/extensions/material_color_extension.dart';
//
// import '../res/color_manager.dart';
//
// class AppTheme {
//   static ThemeData get light {
//     return ThemeData(
//       primarySwatch: AppColors.primary.toMaterialColor(),
//       primaryColor: AppColors.primary,
//       useMaterial3: true,
//       bottomSheetTheme: const BottomSheetThemeData(
//         modalBackgroundColor: AppColors.white,
//         surfaceTintColor: Colors.transparent,
//       ),
//       scaffoldBackgroundColor: AppColors.scaffoldBackground,
//       bottomNavigationBarTheme: BottomNavigationBarThemeData(
//         backgroundColor: AppColors.white,
//         selectedItemColor: AppColors.primary,
//         unselectedItemColor: AppColors.grey,
//         showSelectedLabels: true,
//         showUnselectedLabels: true,
//         type: BottomNavigationBarType.fixed,
//       ),
//       textButtonTheme: TextButtonThemeData(
//         style: TextButton.styleFrom(
//           padding: EdgeInsets.symmetric(horizontal: AppPadding.pW4),
//           foregroundColor: AppColors.primary,
//           minimumSize: Size(AppSize.sW30, AppSize.sH30),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(AppSize.sH0),
//           ),
//         ),
//       ),
//       dialogTheme: const DialogThemeData(
//         surfaceTintColor: Colors.transparent,
//       ),
//       textSelectionTheme: TextSelectionThemeData(
//         cursorColor: AppColors.primary,
//         selectionColor: AppColors.primary.withValues(alpha: 0.2),
//         selectionHandleColor: AppColors.primary,
//       ),
//       appBarTheme: const AppBarTheme(
//         foregroundColor: AppColors.white,
//       ),
//       iconTheme: const IconThemeData(
//         color: AppColors.white,
//       ),
//       inputDecorationTheme: InputDecorationTheme(
//         prefixIconColor: AppColors.border,
//       ),
//       fontFamily: 'Zain',
//       textTheme: TextTheme(
//         headlineLarge: TextStyle(
//           fontSize: FontSize.s18,
//           color: AppColors.secondary,
//           fontWeight: FontWeightManager.medium,
//         ),
//         titleLarge: TextStyle(
//           fontSize: FontSize.s13,
//           color: AppColors.primary,
//         ),
//         titleMedium: TextStyle(
//           fontSize: FontSize.s13,
//           color: AppColors.primary,
//         ),
//         titleSmall: TextStyle(
//           fontSize: FontSize.s13,
//           color: AppColors.primary,
//         ),
//         bodySmall: TextStyle(
//           fontSize: FontSize.s8,
//           color: AppColors.hintText,
//         ),
//       ),
//     );
//   }
//
//   /// Dark theme. Use when [AppColors.isDark] is true (set in App BlocBuilder).
//   static ThemeData get dark {
//     return ThemeData(
//       primarySwatch: AppColors.primary.toMaterialColor(),
//       primaryColor: AppColors.primary,
//       useMaterial3: true,
//       bottomSheetTheme: BottomSheetThemeData(
//         modalBackgroundColor: AppColors.cardFill,
//         surfaceTintColor: Colors.transparent,
//       ),
//       scaffoldBackgroundColor: AppColors.scaffoldBackground,
//       bottomNavigationBarTheme: BottomNavigationBarThemeData(
//         backgroundColor: AppColors.cardFill,
//         selectedItemColor: AppColors.primary,
//         unselectedItemColor: AppColors.grey,
//         showSelectedLabels: true,
//         showUnselectedLabels: true,
//         type: BottomNavigationBarType.fixed,
//       ),
//       textButtonTheme: TextButtonThemeData(
//         style: TextButton.styleFrom(
//           padding: EdgeInsets.symmetric(horizontal: AppPadding.pW4),
//           foregroundColor: AppColors.primary,
//           minimumSize: Size(AppSize.sW30, AppSize.sH30),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(AppSize.sH0),
//           ),
//         ),
//       ),
//       dialogTheme: const DialogThemeData(
//         surfaceTintColor: Colors.transparent,
//       ),
//       textSelectionTheme: TextSelectionThemeData(
//         cursorColor: AppColors.primary,
//         selectionColor: AppColors.primary.withValues(alpha: 0.2),
//         selectionHandleColor: AppColors.primary,
//       ),
//       appBarTheme: const AppBarTheme(
//         foregroundColor: AppColors.white,
//       ),
//       iconTheme: const IconThemeData(
//         color: AppColors.white,
//       ),
//       inputDecorationTheme: InputDecorationTheme(
//         prefixIconColor: AppColors.border,
//       ),
//       fontFamily: 'Zain',
//       textTheme: TextTheme(
//         headlineLarge: TextStyle(
//           fontSize: FontSize.s18,
//           color: AppColors.secondary,
//           fontWeight: FontWeightManager.medium,
//         ),
//         titleLarge: TextStyle(
//           fontSize: FontSize.s13,
//           color: AppColors.primary,
//         ),
//         titleMedium: TextStyle(
//           fontSize: FontSize.s13,
//           color: AppColors.primary,
//         ),
//         titleSmall: TextStyle(
//           fontSize: FontSize.s13,
//           color: AppColors.primary,
//         ),
//         bodySmall: TextStyle(
//           fontSize: FontSize.s8,
//           color: AppColors.hintText,
//         ),
//       ),
//     );
//   }
// }
