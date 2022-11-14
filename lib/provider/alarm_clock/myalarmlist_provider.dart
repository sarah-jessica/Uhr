import 'package:flutter/material.dart';
import 'package:uhr/models/alarm_model.dart';
import 'package:uhr/services/notification_service.dart';

// Daten auf die alle Klassen zugreifen dürfen

class MyAlarmList extends ChangeNotifier {
  List<AlarmModel> alarms = [];


  void addAlarm(DateTime time, String name, bool rep) {
    int id;
    if (alarms.isEmpty) {
      id = 0;
    } else {
      // makes sure to skip id 999, which is used for TimerScreen notifications
      id = alarms[alarms.length-1].getID + 1 == 999 ? alarms[alarms.length-1].getID + 2 : alarms[alarms.length-1].getID + 1;
    }
    alarms.add(AlarmModel(time, name, true, rep, id));
    notifyListeners();
  }

  void deleteAlarm (int index) {
    NotificationService().cancelNotification(
      alarms[index].getID,
    );
    alarms.removeAt(index);
    notifyListeners();
  }

  void changeAlarmStatus(int index, bool isOn) {
    alarms[index].changeAlarm(isOn);
    notifyListeners();
  }

  void changeAlarmData(index, time, name, rep) {
    alarms[index].changeAlarmData(
      time,
      name,
      true,
      rep,
    );
    notifyListeners();
  }

  void updateAlarms() {
    for (int i = 0; i < alarms.length; i++) {
      if (alarms[i].time.isBefore(DateTime.now()) && alarms[i].rep == false) {
        alarms[i].changeAlarm(false);
      }
    }
  }
}