import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uhr/app_router.gr.dart';
import 'package:uhr/provider/alarm_clock/myalarmlist_provider.dart';
import 'package:uhr/provider/timer/mytimer_provider.dart';
import 'package:uhr/services/notification_service.dart';

/*
 - Warning beim Starten der App: 'Operand of null-aware operation '!' has type 'WidgetsBinding' which excludes null.'
 - ob der Alarm bei der Einstellung 'daily' jeden Tag ausgelöst wird, ist nicht getestet
*/

final timerChangeNotifierProvider = ChangeNotifierProvider<MyTimer>((ref) {
  return MyTimer();
});

final alarmListChangeNotifierProvider = ChangeNotifierProvider<MyAlarmList>((ref) {
  return MyAlarmList();
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotification();

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MaterialApp.router(
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
        ),
    );
  }
}
