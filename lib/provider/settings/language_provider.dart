import 'package:flutter/cupertino.dart';
import 'package:uhr/enums/languages.dart';


class LanguageProvider extends ChangeNotifier{

  Locale _language = const Locale.fromSubtags(languageCode: 'en', countryCode: 'US');

  void setLanguage (Languages language) {
    _language = _languageToLocale(language);
    notifyListeners();
  }

  Locale getLanguageAsLocale () {
    return _language;
  }

  Languages getLocaleAsLanguages () {
    return _localeToLanguages(_language);
  }

  Languages _localeToLanguages(Locale locale) {
    if (locale == const Locale.fromSubtags(languageCode: 'en', countryCode: 'US')) {
      return Languages.english;
    } else if (locale == const Locale.fromSubtags(languageCode: 'de', countryCode: 'DE')) {
      return Languages.deutsch;
    } else if (locale == const Locale.fromSubtags(languageCode: 'es', countryCode: 'ES')) {
      return Languages.espanol;
    } else {
      throw Exception('This Locale is not supported');
    }
  }

  Locale _languageToLocale(Languages language) {
    if (language == Languages.english) {
      return const Locale.fromSubtags(languageCode: 'en', countryCode: 'US');
    } else if (language == Languages.deutsch) {
      return const Locale.fromSubtags(languageCode: 'de', countryCode: 'DE');
    } else if (language == Languages.espanol) {
      return const Locale.fromSubtags(languageCode: 'es', countryCode: 'ES');
    } else {
      throw Exception('This Language is not supported');
    }
  }
}