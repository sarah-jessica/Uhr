import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

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

extension StopWatchTimerExtension on StopWatchTimer {
  static String timeAsString (int value) {
    final hStr = StopWatchTimer.getDisplayTimeHours(value);
    final mStr = StopWatchTimer.getDisplayTimeMinute(value);
    final sStr = StopWatchTimer.getDisplayTimeSecond(value);
    final msStr = StopWatchTimer.getDisplayTimeMillisecond(value);
    var result = '';
    if (hStr != '00') {
      if (hStr[0] != '0') {
      result += '$hStr ${tr('hours')}';
      } else{
        result += '${hStr[1]} ${tr('hours')}';
      }
    }
    if (mStr != '00') {
      if (mStr[0] != '0') {
        result += '$mStr ${tr('minutes')}';
      } else{
        result += '${mStr[1]} ${tr('minutes')}';
      }
    }
    if (sStr != '00') {
      if (sStr[0] != '0') {
        result += '$sStr ${tr('seconds')}';
      } else{
        result += '${sStr[1]} ${tr('seconds')}';
      }
    }
    if (msStr != '00') {
      if (msStr[0] != '0') {
        result += '$msStr ${tr('milliseconds')}';
      } else{
        result += '${msStr[1]} ${tr('milliseconds')}';
      }
    }
    return result == '' ? '0' : result;
  }
}