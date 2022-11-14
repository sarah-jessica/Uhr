import 'package:uhr/services/notification_service.dart';
import 'package:uhr/utils/extensions.dart';

// class 'Alarm' with necessary details and functions to turn it on or off

class AlarmModel {
  late DateTime time;
  late String name;
  bool isOn = false;
  late bool rep;
  late int id;

  int get getID {
    return id;
  }

  AlarmModel(this.time, this.name, bool isOn, this.rep, this.id) {
    if (isOn) changeAlarm(isOn);
  }

  void changeAlarmData(DateTime time, String name, bool isOn, bool rep) {
    changeAlarm(false);
    this.time = time;
    this.name = name;
    this.rep = rep;
    if (isOn) changeAlarm(isOn);
  }

  void changeAlarm(bool isOn) {
    if (this.isOn != isOn) {
      this.isOn = isOn;

      if (isOn) {
        if (time.isBefore(DateTime.now())) {
          //set day for alarm to the next day
          time = time.add(const Duration(days: 1));
        } else if (time.subtract(const Duration(days: 1)).isAfter(DateTime.now())) {
          //set day for alarm to today
          time = time.subtract(const Duration(days: 1));
        }

        // set alarm
        NotificationService().showNotification(id, name, time.toFormattedTimeString(), time);
      } else {
        NotificationService().cancelNotification(id);
      }
    }
  }
}
