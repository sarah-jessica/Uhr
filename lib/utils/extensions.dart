import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toFormattedTimeString() {
    return DateFormat('HH : mm').format(this);
  }
}
