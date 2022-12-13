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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import 'ui/screens/alarm_clock/add_alarm_screen.dart' as _i3;
import 'ui/screens/alarm_clock/alarm_clock_screen.dart' as _i2;
import 'ui/screens/alarm_clock/change_alarm_screen.dart' as _i4;
import 'ui/screens/start_screen.dart' as _i1;
import 'ui/screens/stopwatch/stopwatch_screen.dart' as _i5;
import 'ui/screens/timer/timer_screen.dart' as _i6;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    StartRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.StartScreen(),
      );
    },
    AlarmClockRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AlarmClockScreen(),
      );
    },
    AddAlarmRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.AddAlarmScreen(),
      );
    },
    ChangeAlarmRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ChangeAlarmScreen(),
      );
    },
    StopwatchRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.StopwatchScreen(),
      );
    },
    TimerRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.TimerScreen(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          StartRoute.name,
          path: '/',
          children: [
            _i7.RouteConfig(
              AlarmClockRoute.name,
              path: '',
              parent: StartRoute.name,
              children: [
                _i7.RouteConfig(
                  AddAlarmRoute.name,
                  path: 'add-alarm-screen',
                  parent: AlarmClockRoute.name,
                ),
                _i7.RouteConfig(
                  ChangeAlarmRoute.name,
                  path: 'change-alarm-screen',
                  parent: AlarmClockRoute.name,
                ),
              ],
            ),
            _i7.RouteConfig(
              AddAlarmRoute.name,
              path: 'add-alarm-screen',
              parent: StartRoute.name,
            ),
            _i7.RouteConfig(
              ChangeAlarmRoute.name,
              path: 'change-alarm-screen',
              parent: StartRoute.name,
            ),
            _i7.RouteConfig(
              StopwatchRoute.name,
              path: 'stopwatch-screen',
              parent: StartRoute.name,
            ),
            _i7.RouteConfig(
              TimerRoute.name,
              path: 'timer-screen',
              parent: StartRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.StartScreen]
class StartRoute extends _i7.PageRouteInfo<void> {
  const StartRoute({List<_i7.PageRouteInfo>? children})
      : super(
          StartRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'StartRoute';
}

/// generated route for
/// [_i2.AlarmClockScreen]
class AlarmClockRoute extends _i7.PageRouteInfo<void> {
  const AlarmClockRoute({List<_i7.PageRouteInfo>? children})
      : super(
          AlarmClockRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'AlarmClockRoute';
}

/// generated route for
/// [_i3.AddAlarmScreen]
class AddAlarmRoute extends _i7.PageRouteInfo<void> {
  const AddAlarmRoute()
      : super(
          AddAlarmRoute.name,
          path: 'add-alarm-screen',
        );

  static const String name = 'AddAlarmRoute';
}

/// generated route for
/// [_i4.ChangeAlarmScreen]
class ChangeAlarmRoute extends _i7.PageRouteInfo<void> {
  const ChangeAlarmRoute()
      : super(
          ChangeAlarmRoute.name,
          path: 'change-alarm-screen',
        );

  static const String name = 'ChangeAlarmRoute';
}

/// generated route for
/// [_i5.StopwatchScreen]
class StopwatchRoute extends _i7.PageRouteInfo<void> {
  const StopwatchRoute()
      : super(
          StopwatchRoute.name,
          path: 'stopwatch-screen',
        );

  static const String name = 'StopwatchRoute';
}

/// generated route for
/// [_i6.TimerScreen]
class TimerRoute extends _i7.PageRouteInfo<void> {
  const TimerRoute()
      : super(
          TimerRoute.name,
          path: 'timer-screen',
        );

  static const String name = 'TimerRoute';
}
