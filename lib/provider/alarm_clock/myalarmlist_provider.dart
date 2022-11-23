import 'package:flutter/material.dart';
import 'package:uhr/enums/repetition_type.dart';
import 'package:uhr/models/alarm_model.dart';
import 'package:uhr/services/notification_service.dart';

// Daten auf die alle Klassen zugreifen dürfen

class MyAlarmList extends ChangeNotifier {
  final alarms = <AlarmModel>[];

  void addAlarm({
    required DateTime time,
    required String name,
    required RepetitionType repetition,
  }) {
    final alarm = AlarmModel.create(
      name: name,
      time: time,
      repetition: repetition,
    );

    alarms.add(alarm);
    notifyListeners();
  }

  // TODO(Sarah): Anstelle des index, die Id des Alarms übergeben
  // alarms.removeWhere((alarm) => alarm.id == id);
  void deleteAlarm(int index) {
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
