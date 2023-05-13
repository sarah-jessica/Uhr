import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uhr/enums/repetition_type.dart';
import 'package:uhr/models/alarm_model.dart';
import 'package:uhr/services/notification_service.dart';
import 'package:uhr/utils/extensions.dart';

class DatabaseHelper extends ChangeNotifier{
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async{
    final Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final String path = join(documentsDirectory.path, 'newalarmlist.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE newalarmlist(
      id INTEGER PRIMARY KEY,
      name TEXT,
      year INTEGER,
      month INTEGER,
      day INTEGER,
      hour INTEGER,
      minute INTEGER,
      repetition TEXT,
      isOn INTEGER
      )
    ''',);
  }

  Future<List<AlarmModel>> getAlarmlist() async {
    final Database db = await instance.database;
    final alarms = await db.query('newalarmlist');
    final List<AlarmModel> alarmlist =
      alarms.isNotEmpty ? alarms.map((e) => AlarmModel.fromMap(e)).toList() : [];
    return alarmlist;
  }

  Future<int> add (AlarmModel alarm) async {
    final Database db = await instance.database;
    unawaited (NotificationService().showNotification(
      alarm.id, alarm.name, alarm.time.toFormattedTimeString(), alarm.time,),);
    return db.insert('newalarmlist', alarm.toMap());
  }

  Future<int> delete (int id) async {
    final Database db = await instance.database;
    unawaited(NotificationService().cancelNotification(id));
    return db.delete('newalarmlist', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update (AlarmModel alarm) async {
    final Database db = await instance.database;
    await NotificationService().cancelNotification(alarm.id);
    final DateTime now = DateTime.now();
    DateTime newTime = DateTime(
        now.year, now.month, now.day, alarm.time.hour, alarm.time.minute,);
    if (newTime.isBefore(DateTime.now())) {
      //set day for alarm to the next day
      newTime = newTime.add(const Duration(days: 1));
    } else if (newTime.subtract(const Duration(days: 1)).isAfter(DateTime.now())) {
      //set day for alarm to today
      newTime = newTime.subtract(const Duration(days: 1));
    }
    final AlarmModel newAlarm = alarm.copyWith(time: newTime);
    if (alarm.isOn) {
      unawaited(
        NotificationService().showNotification(
          newAlarm.id,
          newAlarm.name,
          newAlarm.time.toFormattedTimeString(),
          newAlarm.time,
        ),
      );
    }
    notifyListeners();
    return db.update('newalarmlist', newAlarm.toMap(), where: 'id = ?', whereArgs: [alarm.id]);
  }

  Future<void> updateState({required AlarmModel alarm, required bool isOn}) async {
    if (alarm.isOn != isOn) {
      if (isOn) {
        final DateTime now = DateTime.now();
        DateTime newTime = DateTime(
          now.year, now.month, now.day, alarm.time.hour, alarm.time.minute,);
        if (newTime.isBefore(DateTime.now())) {
          //set day for alarm to the next day
          newTime = newTime.add(const Duration(days: 1));
        }
        final AlarmModel newAlarm = alarm.copyWith(isOn: true, time: newTime);
        await update(newAlarm);
      } else {
        final AlarmModel newAlarm = alarm.copyWith(isOn: false);
        await update(newAlarm);
      }
      notifyListeners();
    }
  }

  Future<void> updateAlarms() async{
    final List<AlarmModel> list = await getAlarmlist();
    for (int i = 0; i < list.length; i++) {
      if (list[i].time.isBefore(DateTime.now()) &&
          list[i].repetition == RepetitionType.once) {
        await updateState(alarm: list[i], isOn: false);
      }
    }
  }
}