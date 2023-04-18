import 'package:flutter/material.dart';
import 'package:uhr/enums/theme_type.dart';

class CustomTheme extends ChangeNotifier {
  static bool _isLightTheme = true;
  ThemeMode get currentTheme =>
      _isLightTheme ? ThemeMode.light : ThemeMode.dark;
  ThemeType get themeType => _isLightTheme ? ThemeType.light : ThemeType.dark;

  void changeTheme(ThemeType theme) {
    if (theme == ThemeType.light) {
      _isLightTheme = true;
    } else {
      _isLightTheme = false;
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
        headline2: TextStyle(color: Colors.black54),
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
        headline1: TextStyle(color: Colors.white),
        headline2: TextStyle(color: Colors.white60),
      ),
    );
  }
}
