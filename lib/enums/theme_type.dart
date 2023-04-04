

import 'package:easy_localization/easy_localization.dart';

enum ThemeType { light, dark }

extension ThemeTypeExtension on ThemeType {
  String asString() {
    return this == ThemeType.light ? 'light'.tr() : 'dark'.tr();
  }
}
