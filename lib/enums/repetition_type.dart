import 'package:easy_localization/easy_localization.dart';

enum RepetitionType { once, daily }

extension RepetitionTypeExtension on RepetitionType {
  String asString() {
    return this == RepetitionType.daily ? 'daily'.tr() : 'once'.tr();
  }

  static RepetitionType stringToRepetition(String rep) {
    return rep == 'daily'.tr() ? RepetitionType.daily : RepetitionType.once;
  }
}
