import 'package:flutter/material.dart';
import 'package:uhr/screens/alarm clock/alarm_clock.dart';
import 'package:uhr/screens/alarm%20clock/add_alarm.dart';
import 'package:uhr/screens/timer/timer.dart';
import 'package:uhr/screens/stopwatch.dart';
import 'package:uhr/screens/alarm clock/add_alarm.dart';
import 'package:uhr/screens/alarm clock/change_alarm.dart';
import 'package:uhr/notificationService.dart';
import 'package:uhr/screens/timer/running_timer.dart';
import 'package:uhr/screens/timer/paused_timer.dart';


//sound und icon wird in notification.dart nicht anerkannt / default sound wird nicht auf dem Emulator abgespielt
//ob der Alarm bei daily jeden Tag ausgelöst wird, ist nicht getestet
// ggf. Formkey bei change_alarm und add_alarm ergänzen
// Warning beim definieren eines Namens für eine Alarm: 'A RenderFlex overflowed by 89 pixels on the bottom.'


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
        '/alarm_clock' : (context) => AlarmClock(),
        '/stopwatch' : (context) => Stopwatch(),
        '/timer' : (context) => Timer(),
        '/add_alarm' : (context) => AddAlarm(),
        '/change_alarm' : (context) => ChangeAlarm(),
        '/running_timer' : (context) => runningTimer(),
        '/paused_timer' : (context) => pausedTimer(),
      },
    );

  }
}


