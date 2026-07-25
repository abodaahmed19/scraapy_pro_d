import 'package:flutter/material.dart';

/// Single source of colors. Set [isDark] from [ThemeCubit] (e.g. in App BlocBuilder).
/// Same pattern as medexcellenceence: one class, theme-dependent getters.
class AppColors {
  static bool isDark = false;

  // ---------- Light theme values (used when isDark == false) ----------
  static const Color _primaryLight = Color(0xFFD97007);
  static const Color _primaryLiteLight = Color(0xFFFFF8F2);
  static const Color _secondaryLight = Color(0xFFFFD700);
  static const Color _bgLight = Color(0xFFFBFBFB);
  static const Color _cardFillLight = Color(0xFFFFFFFF);
  static const Color _dashboardBGLight = Color(0xFFF7F8FA);
  static const Color _borderLight = Color(0xFFEBEBEB);
  static const Color _selectedBinLight = Color(0xFFF7F7F8);
  static const Color _fontLight = Color(0xFF1C1C1C);
  static const Color _shade1Light = Color(0xFF292929);
  static const Color _shade2Light = Color(0xFF474747);
  static const Color _shade3Light = Color(0xFF666666);
  static const Color _shade4Light = Color(0xFFA3A3A3);
  static const Color _shade5Light = Color(0xFFCCCCCC);
  static const Color _shade6Light = Color(0xFFEEEEEE);
  static const Color _shade7Light = Color(0xFFF7F7F8);
  static const Color _scaffoldBgLight = Color(0xFFFBFBFB);
  static const Color _textFiledLableColorLight = Color(0xff00050A);
  static const Color _grey2Light = Color(0xFFC7C7C7);

  // ---------- Theme-dependent getters (light / dark) ----------
  static Color get primary => isDark ? AppColorsWithDarkMode.primary : _primaryLight;
  static Color get primaryLite => isDark ? AppColorsWithDarkMode.lightPrimary : _primaryLiteLight;
  static Color get secondary => isDark ? AppColorsWithDarkMode.secondary : _secondaryLight;
  static Color get bg => isDark ? AppColorsWithDarkMode.bg : _bgLight;
  static Color get cardFill => isDark ? AppColorsWithDarkMode.cardFill : _cardFillLight;
  static Color get dashboardBG => isDark ? AppColorsWithDarkMode.dashboardBG : _dashboardBGLight;
  static Color get border => isDark ? AppColorsWithDarkMode.border : _borderLight;
  static Color get selectedBin => isDark ? AppColorsWithDarkMode.selectedBin : _selectedBinLight;
  static Color get font => isDark ? AppColorsWithDarkMode.font : _fontLight;
  static Color get shade1 => isDark ? AppColorsWithDarkMode.shade1 : _shade1Light;
  static Color get shade2 => isDark ? AppColorsWithDarkMode.shade2 : _shade2Light;
  static Color get shade3 => isDark ? AppColorsWithDarkMode.shade3 : _shade3Light;
  static Color get shade4 => isDark ? AppColorsWithDarkMode.shade4 : _shade4Light;
  static Color get shade5 => isDark ? AppColorsWithDarkMode.shade5 : _shade5Light;
  static Color get shade6 => isDark ? AppColorsWithDarkMode.shade6 : _shade6Light;
  static Color get shade7 => isDark ? AppColorsWithDarkMode.shade7 : _shade7Light;
  static Color get scaffoldBackground => isDark ? AppColorsWithDarkMode.scaffoldBackground : _scaffoldBgLight;
  static Color get main => font;
  static Color get grey => shade4;
  static Color get hintText => isDark ? AppColorsWithDarkMode.hintText : _shade3Light;
  static Color get buttonColor => primary;
  static Color get activeBorder => primary;
  static Color get textFiledLableColor => isDark ? AppColorsWithDarkMode.font : _textFiledLableColorLight;
  static Color get grey2 => isDark ? AppColorsWithDarkMode.shade5 : _grey2Light;

  // ---------- Scraapy brand colors (from old project) ----------
  static const Color primaryGreen = Color(0xFF00AB97);
  static const Color primaryBlue = Color(0xFF29256C);
  static const Color accent = Color(0xFFFF9800);
  static const Color white70 = Color(0xB3FFFFFF);
  static const Color red = Color(0xFFD9414C);
  static const Color oldError = Color(0xFFFF002A);

  static LinearGradient get scrappyGradient => const LinearGradient(
    colors: [primaryGreen, primaryBlue],
  );

  static LinearGradient get scrappyGradientReversed => const LinearGradient(
    colors: [primaryBlue, primaryGreen],
  );

  // ---------- Fixed colors (same in both themes) ----------
  static const Color semiBlack = Color(0xFF262626);
  static const Color semiPrimary = Color(0xffFDE6CE);
  static const Color lightBlue = Color(0xff00ADBC);
  static const Color accentBlue = Color(0xFF2563EB);
  static const Color blue = Color(0xFF1D4ED8);
  static const Color lightPrimary = Color(0xFFFFF7ED);
  static const Color lightPrimaryAccent = Color(0xFFFFF7ED);
  static const Color buttonBackGround = Color(0xFFF2D2B4);
  static const Color buttonTextColor = Color(0xFF9C9C9C);
  static const Color fifthTextColor = Color(0xFF6B7280);
  static const Color whiteGrey = Color(0xFFE5E5E5);
  static const Color danger = Color(0xFFEC2D30);
  static const Color warning = Color(0xFFFE9B0E);
  static const Color success = Color(0xFF0C9D61);
  static const Color info = Color(0xFF3A70E2);
  static const Color unactiveNav = Color(0xFFB4AFDF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color darkBlack = Color(0xFF1E1E1E);
  static const Color borderColor = Color(0xFFB4DBFE);
  static const Color greyDF = Color(0xffDFDFDF);
  static const Color grey5C = Color(0xff5C5C5C);
  static const Color buttonText = white;
  static const Color error = danger;
  static const Color successColor = success;
  static const Color profileCardBg = Color(0xFFF8F8F8);
  static const Color onlineStatus = Color(0xFF4CAF50);
  static const Color batchDot = Color(0xFFFF8C00);
  static const Color menuIconBgLightBlue = Color(0xFFE0EFFF);
  static const Color menuIconBgLightPurple = Color(0xFFEEE0FF);
  static const Color menuIconBgLightGreen = Color(0xFFE0FFED);
  static const Color menuIconBgLightRed = Color(0xFFFFEFF0);
  static const Color menuIconBgLightGray = Color(0xFFF0F0F0);
  static const Color menuIconBgLightYellow = Color(0xFFFFFBE0);

  // Deprecated / legacy names
  static const Color greyD9 = Color(0xFFD9D9D9);
  static const Color grey1 = Color(0xFFDFDFDF);
  static const Color third = Color(0xFF1F2A37);
  static const Color forth = Color(0xFF583D82);

  static LinearGradient get gradient => const LinearGradient(
    colors: [Color(0xFF340773), Color(0xFFFFD700)],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  static LinearGradient get disableGradient => LinearGradient(
    colors: [shade5, shade4],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  static BoxShadow get containerShadow => BoxShadow(
    color: (isDark ? const Color(0xFF1C1C1C) : const Color(0xFFF0F0F0)).withValues(alpha: isDark ? 0.3 : 1.0),
    offset: const Offset(0, 0),
    blurRadius: 4.0,
    spreadRadius: 0.0,
  );
}

extension ColorExtension on Color {
  bool get isDark => computeLuminance() < 0.5;
}

/// Dark theme palette. Used by [AppColors] getters when [AppColors.isDark] is true.
class AppColorsWithDarkMode {
  static const Color primary = Color(0xFF340773);
  static const Color secondary = Color(0xFFFFD700);
  static const Color lightPrimary = Color(0xFFFFF7ED);
  static const Color lightPrimaryAccent = Color(0xFFFFF7ED);
  static const Color bg = Color(0xFF1C1C1C);
  static const Color cardFill = Color(0xFF292929);
  static const Color dashboardBG = Color(0xFF000000);
  static const Color border = Color(0xFF474747);
  static const Color selectedBin = Color(0xFF292929);
  static const Color font = Color(0xFFFFFFFF);
  static const Color shade1 = Color(0xFFF7F7F8);
  static const Color shade2 = Color(0xFFEEEEEE);
  static const Color shade3 = Color(0xFFCCCCCC);
  static const Color shade4 = Color(0xFFA3A3A3);
  static const Color shade5 = Color(0xFF666666);
  static const Color shade6 = Color(0xFF474747);
  static const Color shade7 = Color(0xFF292929);
  static const Color scaffoldBackground = Color(0xFF1C1C1C);
  static const Color hintText = Color(0xFFCCCCCC);
  static const Color error = Color(0xFFEC2D30);
}
