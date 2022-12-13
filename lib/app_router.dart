import 'package:auto_route/auto_route.dart';
import 'package:uhr/ui/screens/alarm_clock/add_alarm_screen.dart';
import 'package:uhr/ui/screens/alarm_clock/alarm_clock_screen.dart';
import 'package:uhr/ui/screens/alarm_clock/change_alarm_screen.dart';
import 'package:uhr/ui/screens/stopwatch/stopwatch_screen.dart';
import 'package:uhr/ui/screens/timer/timer_screen.dart';
import 'package:uhr/ui/screens/start_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: StartScreen,
      initial: true,
      children: [
        AutoRoute(
          page: AlarmClockScreen,
          initial: true,
          maintainState: true,
          children: [
            AutoRoute(page: AddAlarmScreen),
            AutoRoute(page: ChangeAlarmScreen),
          ]
        ),
        AutoRoute(page: StopwatchScreen),
        AutoRoute(page: TimerScreen),
      ]
    ),
  ],
)

class $AppRouter {}