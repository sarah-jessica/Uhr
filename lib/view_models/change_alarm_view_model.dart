import 'package:flutter/material.dart';
import 'package:uhr/enums/repetition_type.dart';
import '../models/alarm_model.dart';
import '../provider/alarm_clock/myalarmlist_provider.dart';

class ChangeAlarmViewModel extends ChangeNotifier{
  final MyAlarmList myAlarmListProvider;
  final AlarmModel currentAlarm;

  ChangeAlarmViewModel({
    required this.myAlarmListProvider,
    required this.currentAlarm,
  }) {
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
      id: currentAlarm.id,
      time: selectedDate,
      name: alarmNameTextEditingController.text,
      rep: selectedRepetition,
    );
  }

  void deleteAlarm() {
    myAlarmListProvider.deleteAlarm(
      currentAlarm.id,
    );
  }
}
