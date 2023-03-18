enum Languages { english, deutsch, espanol }

extension LanguagesExtension on Languages {
  String asString() {
    if (this == Languages.english) {
      return 'English';
    } else if (this == Languages.deutsch) {
      return 'Deutsch';
    }
    return 'Español';
  }
}