import 'package:uhr/provider/alarm_clock/data.dart';
import 'package:uhr/services/notification_service.dart';

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


  AlarmModel(this.time, this.name, bool isOn, this.rep) {
    if (alarms.isEmpty) {
      id = 0;
    } else {
      // makes sure to skip id 999, which is used for TimerScreen notifications
      id = alarms[alarms.length-1].getID + 1 == 999 ? alarms[alarms.length-1].getID + 2 : alarms[alarms.length-1].getID + 1;
    }

    if (isOn) changeAlarm(isOn);
  }

  void changeAlarmData (DateTime time, String name, bool isOn, bool rep) {
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

        // converting time to String
        String hour = time.hour < 10 ? '0${time.hour}' : time.hour.toString();
        String minute = time.minute < 10 ? '0${time.minute}' : time.minute.toString();

        // set alarm
        NotificationService().showNotification(id, name, '$hour : $minute', time, rep);
      } else {
        NotificationService().cancelNotification(id);
      }
    }
  }
}

