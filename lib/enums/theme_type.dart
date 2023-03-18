import 'package:localization/localization.dart';

enum ThemeType { light, dark }

extension ThemeTypeExtension on ThemeType {
  String asString() {
    return this == ThemeType.light ? 'light'.i18n() : 'dark'.i18n();
  }
}