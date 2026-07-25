import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

const ThemeMode _defaultTheme = ThemeMode.light;

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(themeMode: _defaultTheme)) {
    // _loadThemeMode();
  }

  static const String _themeModeKey = 'app_theme_mode';

  // Future<void> _loadThemeMode() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final saved = prefs.getString(_themeModeKey);
  //   final mode = saved == 'dark' ? ThemeMode.dark : _defaultTheme;
  //   _setSystemOverlay(mode);
  //   emit(ThemeState(themeMode: mode));
  // }

  void _setSystemOverlay(ThemeMode mode) {
    if (mode == ThemeMode.dark) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    }
  }

  /// Toggle between light and dark theme. Persists choice.
  // Future<void> toggleTheme() async {
  //   final next = state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString(_themeModeKey, next == ThemeMode.light ? 'light' : 'dark');
  //   _setSystemOverlay(next);
  //   emit(ThemeState(themeMode: next));
  // }

  /// Set theme explicitly (light / dark / system).
  // Future<void> setThemeMode(ThemeMode mode) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString(
  //     _themeModeKey,
  //     mode == ThemeMode.dark ? 'dark' : (mode == ThemeMode.light ? 'light' : 'system'),
  //   );
  //   if (mode != ThemeMode.system) _setSystemOverlay(mode);
  //   emit(ThemeState(themeMode: mode));
  // }
}
