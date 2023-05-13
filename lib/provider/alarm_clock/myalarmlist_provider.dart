import 'package:flutter/material.dart';
import 'package:uhr/enums/repetition_type.dart';
import 'package:uhr/models/alarm_model.dart';
import 'package:uhr/services/notification_service.dart';
import 'package:uhr/utils/extensions.dart';

//only used in change_alarm_view_model.dart which is not used anymore

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
      isOn: true,
    );

    alarms.add(alarm);
    NotificationService().showNotification(
        alarm.id, alarm.name, alarm.time.toFormattedTimeString(), alarm.time,);
    notifyListeners();
  }

  void deleteAlarm(int id) {
    NotificationService().cancelNotification(id);
    alarms.removeWhere((alarm) => alarm.id == id);
    notifyListeners();
  }

  Future<void> changeAlarmState({required int id, required bool isOn}) async {
    final int index = alarms.indexWhere((alarm) => alarm.id == id);
    final AlarmModel alarm = alarms[index];
    if (alarm.isOn != isOn) {
      if (isOn) {
        DateTime time = alarm.time;
        if (time.isBefore(DateTime.now())) {
          //set day for alarm to the next day
          time = time.add(const Duration(days: 1));
        } else if (time
            .subtract(const Duration(days: 1))
            .isAfter(DateTime.now())) {
          //set day for alarm to today
          time = time.subtract(const Duration(days: 1));
        }
        alarms[index] = alarm.copyWith(
          time: time,
          isOn: true,
        );
        // set alarm
        await NotificationService().showNotification(id, alarms[index].name,
            alarms[index].time.toFormattedTimeString(), alarms[index].time,);
      } else {
        alarms[index] = alarm.copyWith(
          isOn: false,
        );
        await NotificationService().cancelNotification(id);
      }
    }
    notifyListeners();
  }

  Future<void> changeAlarmData({
    required int id,
    required DateTime time,
    required String name,
    required RepetitionType rep,
  }) async {
    final int index = alarms.indexWhere((alarm) => alarm.id == id);
    late DateTime newTime;
    await NotificationService().cancelNotification(id);
    if (time.isBefore(DateTime.now())) {
      //set day for alarm to the next day
      newTime = time.add(const Duration(days: 1));
    } else if (time.subtract(const Duration(days: 1)).isAfter(DateTime.now())) {
      //set day for alarm to today
      newTime = time.subtract(const Duration(days: 1));
    } else {
      newTime = time;
    }
    alarms[index] = alarms[index].copyWith(
      name: name,
      time: newTime,
      type: rep,
      isOn: true,
    );
    await NotificationService().showNotification(id, alarms[index].name,
        alarms[index].time.toFormattedTimeString(), alarms[index].time,);
    notifyListeners();
  }

  void updateAlarms() {
    for (int i = 0; i < alarms.length; i++) {
      if (alarms[i].time.isBefore(DateTime.now()) &&
          alarms[i].repetition == RepetitionType.once) {
        changeAlarmState(id: alarms[i].id, isOn: false);
      }
    }
  }
}
