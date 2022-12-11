import 'package:flutter/material.dart';

import '../enums/repetition_type.dart';
import '../models/alarm_model.dart';
import '../provider/alarm_clock/myalarmlist_provider.dart';

class ChangeAlarmViewModel extends ChangeNotifier {
  final MyAlarmList myAlarmListProvider;
  final AlarmModel currentAlarm;

  ChangeAlarmViewModel(
    this.myAlarmListProvider,
    this.currentAlarm,
  ) {
    alarmNameTextEditingController.text = currentAlarm.name;
  }

  final alarmNameTextEditingController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  RepetitionType selectedRepetition = RepetitionType.once;

  void onDateSelected(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  void onRepetitionSelected(RepetitionType? repetition) {
    if (repetition == null) {
      return;
    }
    selectedRepetition = repetition;
    notifyListeners();
  }

  void updateAlarm() {
    myAlarmListProvider.changeAlarmData(
      currentAlarm.id,
      selectedDate,
      alarmNameTextEditingController.text,
      selectedRepetition,
    );
  }

  void deleteAlarm() {
    myAlarmListProvider.deleteAlarm(
      currentAlarm.id,
    );
  }
}
