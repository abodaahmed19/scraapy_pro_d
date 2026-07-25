import 'dart:io';

import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

class ConstantManager {
  static const String bundleId = "";
  static double get fontSizeScale => Platform.isAndroid ? 0.95 : 1.0;

  static const String appName = "Scraapy";
  static const String fontFamily = "Zain";
  static const String token = "token";
  static const String projectName = "Scraapy";
  static const int splashTimer = 4;
  /// Primary REST API (used by [DioService]).
  static const String baseUrl = "https://api.scraapy.sa/api/";
  static const String baseUrl2 = "https://scraapy.net/api/";

  /// Public site (legal / marketing). Replace if your team uses another URL.
  static const String legalInformationUrl = 'https://scraapy.sa';

  /// Support contact — update with production numbers before release.
  static const String supportPhoneTel = '+966500000000';
  /// Digits for [LauncherHelper.launchWhatsApp] (country code + number, no +).
  static const String supportWhatsAppDigits = '966500000000';
  static const String supportEmailAddress = 'info@scraapy.sa';

  /// Origin for resolving relative media paths (e.g. `/categorygroup_icons/...`).
  static String get apiMediaOrigin =>
      baseUrl.replaceFirst(RegExp(r'/api/?$'), '');
  static const String emptyText = "";
  static const int zero = 0;
  static const double zeroAsDouble = 0.0;
  static const int pinCodeFieldsCount = 4;
  static const int maxLines = 4;
  static const double snackbarElevation = 4;
  static const int snackbarDuration = 4;
  static const int connectTimeoutDuration = 30;
  static const int recieveTimeoutDuration = 30;
  static const double customImageSliderAsepctRatio = 3;
}
