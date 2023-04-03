import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:uhr/enums/languages.dart';

class LanguageProvider extends ChangeNotifier {
  late Locale _language;
  late BuildContext myContext;

  void setContext (BuildContext myContext) {
    this.myContext = myContext;
    _language = this.myContext.locale;
  }

  void setLanguage(Languages language) {
    _language = _languageToLocale(language);
    try {
      myContext.setLocale(getLanguageAsLocale());
    }
    catch (e) {
      throw Exception('You need to use setContext() before using setLanguage()');
    }
    notifyListeners();
  }

  Locale getLanguageAsLocale() {
    if (_language == null) {
      throw Exception('You need to use setLanguage() before using getLanguageAsLocale()');
    }
    return _language;
  }

  Languages getLocaleAsLanguages() {
    if (_language == null) {
      throw Exception('You need to use setLanguage() before using getLocaleAsLanguages()');
    }
    return _localeToLanguages(_language);
  }

  Languages _localeToLanguages(Locale locale) {
    if (locale ==
        const Locale.fromSubtags(languageCode: 'en', countryCode: 'US')) {
      return Languages.english;
    } else if (locale ==
        const Locale.fromSubtags(languageCode: 'de', countryCode: 'DE')) {
      return Languages.deutsch;
    } else if (locale ==
        const Locale.fromSubtags(languageCode: 'es', countryCode: 'ES')) {
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
