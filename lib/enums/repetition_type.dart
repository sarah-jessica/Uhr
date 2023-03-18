import 'package:localization/localization.dart';

enum RepetitionType { once, daily }

extension RepetitionTypeExtension on RepetitionType {
  String asString() {
    return this == RepetitionType.daily ? 'daily'.i18n() : 'once'.i18n();
  }

  static RepetitionType stringToRepetition(String rep) {
    return rep == 'daily'.i18n() ? RepetitionType.daily : RepetitionType.once;
  }
}
