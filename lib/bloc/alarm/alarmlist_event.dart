part of 'alarmlist_bloc.dart';

class AlarmListEvent {}

class AddAlarm extends AlarmListEvent{
  final DateTime time;
  final String name;
  final RepetitionType repetition;

  AddAlarm({
    required this.time,
    required this.name,
    required this.repetition,
  });
}

class ChangeAlarm extends AlarmListEvent{
  final int id;
  final bool isOn;

  ChangeAlarm({
    required this.id,
    required this.isOn,
  });
}

class ChangeAlarmData extends AlarmListEvent{
  final int id;
  final DateTime time;
  final String name;
  final RepetitionType repetition;

  ChangeAlarmData({
    required this.id,
    required this.time,
    required this.name,
    required this.repetition,
  });
}

class DeleteAlarm extends AlarmListEvent{
  final int id;
  DeleteAlarm({required this.id,});
}
