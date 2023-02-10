import 'package:auto_route/auto_route.dart';
import 'package:uhr/services/alarm_clock_router.dart';
import 'package:uhr/ui/screens/alarm_clock/add_alarm_screen.dart';
import 'package:uhr/ui/screens/alarm_clock/alarm_clock_screen.dart';
import 'package:uhr/ui/screens/alarm_clock/change_alarm_screen.dart';
import 'package:uhr/ui/screens/start_screen.dart';
import 'package:uhr/ui/screens/stopwatch/stopwatch_screen.dart';
import 'package:uhr/ui/screens/timer/timer_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Page',
  routes: <AutoRoute>[
    AutoRoute(
      page: StartScreen,
      deferredLoading: true,
      path: '/',
      children: [
        AutoRoute(
          page: AlarmClockRouter,
          name: 'AlarmClockRouter',
          path: 'alarmClockRouter',
          maintainState: false,
          deferredLoading: true,
          children: [
            AutoRoute(
              page: AlarmClockScreen,
              maintainState: false,
              initial: true,
              path: '',
            ),
            AutoRoute(
              page: AddAlarmScreen,
              path: 'addAlarmScreen',
            ),
            AutoRoute(
                page: ChangeAlarmScreen,
              path: 'changeAlarmScreen',
            ),
          ],
        ),
        AutoRoute(page: StopwatchScreen),
        AutoRoute(page: TimerScreen),
      ],
    ),
  ],
)

class $AppRouter {}


