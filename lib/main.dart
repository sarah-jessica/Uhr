import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uhr/ui/screens/alarm_clock/alarm_clock_screen.dart';
import 'package:uhr/ui/screens/alarm_clock/change_alarm_screen.dart';
import 'package:uhr/ui/screens/timer/timer_screen.dart';
import 'package:uhr/ui/screens/stopwatch/stopwatch_screen.dart';
import 'package:uhr/services/notification_service.dart';
import 'package:uhr/provider/timer/mytimer_provider.dart';
import 'package:uhr/provider/alarm_clock/myalarmlist_provider.dart';


/*
 - Warning beim Starten der App: 'Operand of null-aware operation '!' has type 'WidgetsBinding' which excludes null.'
 - ob der Alarm bei der Einstellung 'daily' jeden Tag ausgelöst wird, ist nicht getestet
 - ggf. einen Form-Key bei change_alarm und add_alarm ergänzen
*/

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotification();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyTimer()),
        ChangeNotifierProvider(create: (_) => MyAlarmList()),
      ],
      child: const MyApp(),
    ),

      //const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: const MyStatefulWidget(),
      routes: {
        '/change_alarm' : (context) => const ChangeAlarmScreen(),
      },
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Clock App'),
        bottom: TabBar(
          indicatorColor: Colors.black,
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.alarm, color: Colors.black),
            ),
            Tab(
              icon: Icon(Icons.timer_sharp, color: Colors.black),
            ),
            Tab(
              icon: Icon(Icons.hourglass_empty, color: Colors.black),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Center(
            child: AlarmClockScreen(),
          ),
          Center(
            child: StopwatchScreen(),
          ),
          Center(
            child: TimerScreen(),
          ),
        ],
      ),
    );
  }
}



