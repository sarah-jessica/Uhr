import 'dart:convert';
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

  factory AlarmModel.fromJason(String source) => AlarmModel.fromMap(json.decode(source));

  factory AlarmModel.fromMap(Map<String, dynamic> map) {
    final DateTime time = DateTime(map['year'], map['month'], map['day'], map['hour'], map['minute']);
    return AlarmModel._(
      id: map['id'],
      name: map['name'],
      time: time,
      repetition: RepetitionTypeExtension.stringToRepetition(map['repetition']),
      isOn: map['isOn'] == 1,
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

  Map<String, dynamic> toMap () {
    return {
      'id' : id,
      'name' : name,
      'year' : time.year,
      'month' : time.month,
      'day' : time.day,
      'hour' : time.hour,
      'minute' : time.minute,
      'repetition' : repetition.asString(),
      'isOn' : isOn ? 1 : 0,
    };
  }

  String toJason() => jsonEncode(toMap());
}
