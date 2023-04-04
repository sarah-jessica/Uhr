import 'dart:math';
import 'package:uhr/enums/repetition_type.dart';

class AlarmModel {
  final int id;
  final String name;
  final DateTime time;
  final RepetitionType repetition;
  final bool isOn;

  AlarmModel._({
    required this.id,
    required this.name,
    required this.time,
    required this.repetition,
    required this.isOn,
  });

  factory AlarmModel.create({
    required String name,
    required DateTime time,
    required RepetitionType repetition,
    required bool isOn,
  }) {
    final id = Random().nextInt(2147483647);

    return AlarmModel._(
      id: id,
      name: name,
      time: time,
      repetition: repetition,
      isOn: isOn,
    );
  }

  AlarmModel copyWith({
    String? name,
    DateTime? time,
    RepetitionType? type,
    bool? isOn,
  }) {
    return AlarmModel._(
      id: id,
      name: name ?? this.name,
      time: time ?? this.time,
      repetition: type ?? repetition,
      isOn: isOn ?? this.isOn,
    );
  }
}
