import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uhr/enums/theme_type.dart';

import '../../services.dart';

class CustomTheme extends ChangeNotifier {
  final prefs = services<SharedPreferences>();

  ThemeMode? mode;

  ThemeType get themeType => mode == ThemeMode.dark ? ThemeType.dark : ThemeType.light;

  ThemeMode get themeMode => mode == ThemeMode.dark ? ThemeMode.dark : ThemeMode.light;

  void initializeThemeMode() {
    if (mode == null) {
      final String? theme = prefs.getString('theme');
      mode = theme == 'dark' ? ThemeMode.dark : ThemeMode.light;
      notifyListeners();
    }
  }

  Future<void> setThemeMode(ThemeType theme) async {
    if (theme == ThemeType.light) {
      await prefs.setString('theme', 'light');
      mode = ThemeMode.light;
    } else {
      await prefs.setString('theme', 'dark');
      mode = ThemeMode.dark;
    }
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.white,
      backgroundColor: Colors.white,
      shadowColor: Colors.white54,
      textTheme: const TextTheme(
        headline1: TextStyle(color: Colors.black),
        headline2: TextStyle(color: Colors.black38),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Colors.black,
      backgroundColor: Colors.grey[850],
      scaffoldBackgroundColor: Colors.grey[850],
      shadowColor: Colors.white54,
      dialogBackgroundColor: Colors.grey[900],
      textTheme: const TextTheme(
        headline1: TextStyle(color: Colors.white60),
        headline2: TextStyle(color: Colors.white24),
      ),
    );
  }
}
