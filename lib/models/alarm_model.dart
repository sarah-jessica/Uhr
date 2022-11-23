import 'package:uhr/enums/repetition_type.dart';
import 'package:uhr/services/notification_service.dart';
import 'package:uhr/utils/extensions.dart';
import 'package:uuid/uuid.dart';

// class 'Alarm' with necessary details and functions to turn it on or off

class AlarmModel {
  final String id;
  final String name;
  final DateTime time;
  final RepetitionType repetition;
  final bool? isOn;

  AlarmModel._({
    required this.id,
    required this.name,
    required this.time,
    required this.repetition,
    this.isOn = false,
  });

  factory AlarmModel.create({
    required String name,
    required DateTime time,
    required RepetitionType repetition,
    bool? isOn,
  }) {
    final id = const Uuid().v1();

    return AlarmModel._(
      id: id,
      name: name,
      time: time,
      repetition: repetition,
      isOn: isOn,
    );
  }

  AlarmModel copyWith({String? name}) {
    return AlarmModel._(
      name: name ?? this.name,
      // TODO(Sarah): restliche Parameter
    );
  }

  // AlarmModel(this.time, this.name, bool isOn, this.rep, this.id) {
  //   if (isOn) changeAlarm(isOn);
  // }


  // TODO(Sarah): Logik aus dem Model entfernen und in den Provider verschieben
  void changeAlarmData(DateTime time, String name, bool isOn, bool rep) {
    changeAlarm(false);
    this.time = time;
    this.name = name;
    this.rep = rep;
    if (isOn) changeAlarm(isOn);
  }

  // TODO(Sarah): Logik aus dem Model entfernen und in den Provider verschieben
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
