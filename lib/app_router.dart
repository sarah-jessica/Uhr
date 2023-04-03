import 'package:auto_route/auto_route.dart';
import 'package:uhr/services/router/alarm_clock_router.dart';
import 'package:uhr/services/router/stopwatch_router.dart';
import 'package:uhr/services/router/timer_router.dart';
import 'package:uhr/ui/screens/alarm_clock/add_alarm_screen.dart';
import 'package:uhr/ui/screens/alarm_clock/alarm_clock_screen.dart';
import 'package:uhr/ui/screens/alarm_clock/change_alarm_screen.dart';
import 'package:uhr/ui/screens/settings_screen.dart';
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
          maintainState: false,
          deferredLoading: true,
          children: [
            AutoRoute(
              page: SettingsScreen,
            ),
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
        AutoRoute(
          page: StopwatchRouter,
          name: 'StopwatchRouter',
          path: 'stopwatchRouter',
          maintainState: false,
          deferredLoading: true,
          children: [
            AutoRoute(
              page: StopwatchScreen,
              path: '',
            ),
            AutoRoute(page: SettingsScreen),
          ],
        ),
        AutoRoute(
          page: TimerRouter,
          name: 'TimerRouter',
          path: 'timerClockRouter',
          maintainState: false,
          deferredLoading: true,
          children: [
            AutoRoute(
              page: TimerScreen,
              path: '',
            ),
            AutoRoute(page: SettingsScreen),
          ],
        ),
      ],
    ),
  ],
)
class $AppRouter {}
