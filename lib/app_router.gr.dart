// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import 'services/alarm_clock_router.dart' deferred as _i2;
import 'ui/screens/alarm_clock/add_alarm_screen.dart' as _i6;
import 'ui/screens/alarm_clock/alarm_clock_screen.dart' as _i5;
import 'ui/screens/alarm_clock/change_alarm_screen.dart' as _i7;
import 'ui/screens/start_screen.dart' deferred as _i1;
import 'ui/screens/stopwatch/stopwatch_screen.dart' as _i3;
import 'ui/screens/timer/timer_screen.dart' as _i4;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    StartPage.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.DeferredWidget(
          _i1.loadLibrary,
          () => _i1.StartScreen(),
        ),
      );
    },
    AlarmClockRouter.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.DeferredWidget(
          _i2.loadLibrary,
          () => _i2.AlarmClockRouter(),
        ),
      );
    },
    StopwatchPage.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.StopwatchScreen(),
      );
    },
    TimerPage.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.TimerScreen(),
      );
    },
    AlarmClockPage.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.AlarmClockScreen(),
      );
    },
    AddAlarmPage.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.AddAlarmScreen(),
      );
    },
    ChangeAlarmPage.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.ChangeAlarmScreen(),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          StartPage.name,
          path: '/',
          deferredLoading: true,
          children: [
            _i8.RouteConfig(
              AlarmClockRouter.name,
              path: 'alarmClockRouter',
              parent: StartPage.name,
              deferredLoading: true,
              children: [
                _i8.RouteConfig(
                  AlarmClockPage.name,
                  path: '',
                  parent: AlarmClockRouter.name,
                ),
                _i8.RouteConfig(
                  AddAlarmPage.name,
                  path: 'addAlarmScreen',
                  parent: AlarmClockRouter.name,
                ),
                _i8.RouteConfig(
                  ChangeAlarmPage.name,
                  path: 'changeAlarmScreen',
                  parent: AlarmClockRouter.name,
                ),
              ],
            ),
            _i8.RouteConfig(
              StopwatchPage.name,
              path: 'stopwatch-screen',
              parent: StartPage.name,
            ),
            _i8.RouteConfig(
              TimerPage.name,
              path: 'timer-screen',
              parent: StartPage.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.StartScreen]
class StartPage extends _i8.PageRouteInfo<void> {
  const StartPage({List<_i8.PageRouteInfo>? children})
      : super(
          StartPage.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'StartPage';
}

/// generated route for
/// [_i2.AlarmClockRouter]
class AlarmClockRouter extends _i8.PageRouteInfo<void> {
  const AlarmClockRouter({List<_i8.PageRouteInfo>? children})
      : super(
          AlarmClockRouter.name,
          path: 'alarmClockRouter',
          initialChildren: children,
        );

  static const String name = 'AlarmClockRouter';
}

/// generated route for
/// [_i3.StopwatchScreen]
class StopwatchPage extends _i8.PageRouteInfo<void> {
  const StopwatchPage()
      : super(
          StopwatchPage.name,
          path: 'stopwatch-screen',
        );

  static const String name = 'StopwatchPage';
}

/// generated route for
/// [_i4.TimerScreen]
class TimerPage extends _i8.PageRouteInfo<void> {
  const TimerPage()
      : super(
          TimerPage.name,
          path: 'timer-screen',
        );

  static const String name = 'TimerPage';
}

/// generated route for
/// [_i5.AlarmClockScreen]
class AlarmClockPage extends _i8.PageRouteInfo<void> {
  const AlarmClockPage()
      : super(
          AlarmClockPage.name,
          path: '',
        );

  static const String name = 'AlarmClockPage';
}

/// generated route for
/// [_i6.AddAlarmScreen]
class AddAlarmPage extends _i8.PageRouteInfo<void> {
  const AddAlarmPage()
      : super(
          AddAlarmPage.name,
          path: 'addAlarmScreen',
        );

  static const String name = 'AddAlarmPage';
}

/// generated route for
/// [_i7.ChangeAlarmScreen]
class ChangeAlarmPage extends _i8.PageRouteInfo<void> {
  const ChangeAlarmPage()
      : super(
          ChangeAlarmPage.name,
          path: 'changeAlarmScreen',
        );

  static const String name = 'ChangeAlarmPage';
}
