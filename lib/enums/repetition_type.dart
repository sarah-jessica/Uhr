enum RepetitionType { once, daily }

extension RepetitionTypeExtension on RepetitionType {
  String asString() {
    return this == RepetitionType.daily ? "Daily" : "Once";
  }
}
