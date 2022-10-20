import 'package:flutter/material.dart';
import 'package:uhr/alarm_clock/alarm_clock.dart';
import 'package:uhr/alarm_clock/add_alarm.dart';
import 'package:uhr/alarm_clock/change_alarm.dart';
import 'package:uhr/timer/timer.dart';
import 'package:uhr/stopwatch/stopwatch.dart';
import 'package:uhr/notification_service.dart';
import 'package:uhr/timer/running_timer.dart';

/*
 - Warning beim Starten der App: 'Operand of null-aware operation '!' has type 'WidgetsBinding' which excludes null.'
 - ob der Alarm bei der Einstellung 'daily' jeden Tag ausgelöst wird, ist nicht getestet
 - ggf. einen Form-Key bei change_alarm und add_alarm ergänzen
 - Warning beim Eingeben eines Namens für einen Alarm: 'A RenderFlex overflowed by 89 pixels on the bottom.'
 - assertion 'There are multiple heroes that share the same tag within a subtree.' tritt auf
*/

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotification();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      initialRoute: '/alarm_clock',
      routes: {
        '/alarm_clock' : (context) => const AlarmClock(),
        '/stopwatch' : (context) => const Stopwatch(),
        '/timer' : (context) => const Timer(),
        '/add_alarm' : (context) => const AddAlarm(),
        '/change_alarm' : (context) => const ChangeAlarm(),
        '/running_timer' : (context) => const RunningTimer(),
      },
    );

  }
}


