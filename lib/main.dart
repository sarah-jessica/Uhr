import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uhr/app_router.gr.dart';
import 'package:uhr/bloc/alarm/alarmlist_bloc.dart';
import 'package:uhr/bloc/timer/timer_bloc.dart';
import 'package:uhr/services/notification_service.dart';

/*
 - Warning beim Starten der App: 'Operand of null-aware operation '!' has type 'WidgetsBinding' which excludes null.'
 - ob der Alarm bei der Einstellung 'daily' jeden Tag ausgelöst wird, ist nicht getestet
 - Error in app_router.gr.dart
*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotification();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<TimerBloc>(
          create: (_) => TimerBloc(),
        ),
        BlocProvider<AlarmListBloc>(
          create: (_) => AlarmListBloc(),
        ),
      ],
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