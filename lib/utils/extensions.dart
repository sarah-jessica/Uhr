import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toFormattedTimeString() {
    return DateFormat('HH : mm').format(this);
  }
}

extension LocaleExtension on Locale {
  String asString() {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'de':
        return 'Deutsch';
      default:
        return 'Español';
    }
  }
}
