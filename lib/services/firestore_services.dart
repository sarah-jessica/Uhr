import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uhr/enums/repetition_type.dart';
import 'package:uhr/services/notification_service.dart';
import 'package:uhr/utils/extensions.dart';

class FirestoreServices {

  final CollectionReference alarmclocksCollection = FirebaseFirestore.instance.collection('alarmclocks');

  void addAlarm({
    required DateTime time,
    required String name,
    required RepetitionType repetition,
  }) {
    final int id = Random().nextInt(2147483647);
    NotificationService().showNotification(
      id, name, time.toFormattedTimeString(), time,);
    alarmclocksCollection.doc(id.toString()).set({
      'name': name,
      'time': time,
      'type': repetition.asString(),
      'isOn': true,
    });
  }

  Future<void> changeAlarmData({
    required int id,
    required DateTime time,
    required String name,
    required RepetitionType rep,
  }) async {
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
    await NotificationService().showNotification(id, name,
      time.toFormattedTimeString(), newTime,);
    return alarmclocksCollection.doc(id.toString()).set({
      'name': name,
      'time': newTime,
      'type': rep.asString(),
      'isOn': true,
    });
  }

  Future<void> changeAlarmState({
    required int id,
    required bool isOn,
  }) async {
    final DocumentSnapshot<Object?> alarm = await alarmclocksCollection.doc(id.toString()).get();
    if (alarm['isOn'] != isOn) {
      if (isOn) {
        DateTime time = DateTime.fromMillisecondsSinceEpoch(alarm['time'].seconds * 1000);
        if (time.isBefore(DateTime.now())) {
          //set day for alarm to the next day
          time = time.add(const Duration(days: 1));
        } else if (time
            .subtract(const Duration(days: 1))
            .isAfter(DateTime.now())) {
          //set day for alarm to today
          time = time.subtract(const Duration(days: 1));
        }
        await NotificationService().showNotification(id, alarm['name'],
          time.toFormattedTimeString(), time,);
        return alarmclocksCollection.doc(id.toString()).update({
          'time': time,
          'isOn': isOn,
        });
      } else {
        await NotificationService().cancelNotification(id);
        return alarmclocksCollection.doc(id.toString()).update({
          'isOn': false,
        });
      }
    }
  }

  Future<void> updateAlarms({
    required int id,
    required DateTime time,
    required RepetitionType rep,
  }) async {
    if (time.isBefore(DateTime.now()) && rep == RepetitionType.once) {
      await changeAlarmState(id: id, isOn: false);
    }
  }

  void deleteAlarm(int id) {
    NotificationService().cancelNotification(id);
    alarmclocksCollection.doc(id.toString()).delete();
  }


}