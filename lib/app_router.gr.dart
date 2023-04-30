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
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import 'enums/repetition_type.dart' as _i13;
import 'services/router/alarm_clock_router.dart' deferred as _i2;
import 'services/router/stopwatch_router.dart' deferred as _i3;
import 'services/router/timer_router.dart' deferred as _i4;
import 'ui/screens/alarm_clock/add_alarm_screen.dart' as _i7;
import 'ui/screens/alarm_clock/alarm_clock_screen.dart' as _i6;
import 'ui/screens/alarm_clock/change_alarm_screen.dart' as _i8;
import 'ui/screens/settings_screen.dart' as _i5;
import 'ui/screens/start_screen.dart' deferred as _i1;
import 'ui/screens/stopwatch/stopwatch_screen.dart' as _i9;
import 'ui/screens/timer/timer_screen.dart' as _i10;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    StartPage.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.DeferredWidget(
          _i1.loadLibrary,
          () => _i1.StartScreen(),
        ),
      );
    },
    AlarmClockRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.DeferredWidget(
          _i2.loadLibrary,
          () => _i2.AlarmClockRouter(),
        ),
        maintainState: false,
      );
    },
    StopwatchRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.DeferredWidget(
          _i3.loadLibrary,
          () => _i3.StopwatchRouter(),
        ),
        maintainState: false,
      );
    },
    TimerRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.DeferredWidget(
          _i4.loadLibrary,
          () => _i4.TimerRouter(),
        ),
        maintainState: false,
      );
    },
    SettingsPage.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.SettingsScreen(),
      );
    },
    AlarmClockPage.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.AlarmClockScreen(),
        maintainState: false,
      );
    },
    AddAlarmPage.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.AddAlarmScreen(),
      );
    },
    ChangeAlarmPage.name: (routeData) {
      final args = routeData.argsAs<ChangeAlarmPageArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.ChangeAlarmScreen(
          key: args.key,
          id: args.id,
          name: args.name,
          time: args.time,
          repetition: args.repetition,
          isOn: args.isOn,
        ),
      );
    },
    StopwatchPage.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.StopwatchScreen(),
      );
    },
    TimerPage.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.TimerScreen(),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          StartPage.name,
          path: '/',
          deferredLoading: true,
          children: [
            _i11.RouteConfig(
              AlarmClockRouter.name,
              path: 'alarm-clock-router',
              parent: StartPage.name,
              deferredLoading: true,
              children: [
                _i11.RouteConfig(
                  SettingsPage.name,
                  path: 'settings-screen',
                  parent: AlarmClockRouter.name,
                ),
                _i11.RouteConfig(
                  AlarmClockPage.name,
                  path: '',
                  parent: AlarmClockRouter.name,
                ),
                _i11.RouteConfig(
                  AddAlarmPage.name,
                  path: 'addAlarmScreen',
                  parent: AlarmClockRouter.name,
                ),
                _i11.RouteConfig(
                  ChangeAlarmPage.name,
                  path: 'changeAlarmScreen',
                  parent: AlarmClockRouter.name,
                ),
              ],
            ),
            _i11.RouteConfig(
              StopwatchRouter.name,
              path: 'stopwatchRouter',
              parent: StartPage.name,
              deferredLoading: true,
              children: [
                _i11.RouteConfig(
                  StopwatchPage.name,
                  path: '',
                  parent: StopwatchRouter.name,
                ),
                _i11.RouteConfig(
                  SettingsPage.name,
                  path: 'settings-screen',
                  parent: StopwatchRouter.name,
                ),
              ],
            ),
            _i11.RouteConfig(
              TimerRouter.name,
              path: 'timerClockRouter',
              parent: StartPage.name,
              deferredLoading: true,
              children: [
                _i11.RouteConfig(
                  TimerPage.name,
                  path: '',
                  parent: TimerRouter.name,
                ),
                _i11.RouteConfig(
                  SettingsPage.name,
                  path: 'settings-screen',
                  parent: TimerRouter.name,
                ),
              ],
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.StartScreen]
class StartPage extends _i11.PageRouteInfo<void> {
  const StartPage({List<_i11.PageRouteInfo>? children})
      : super(
          StartPage.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'StartPage';
}

/// generated route for
/// [_i2.AlarmClockRouter]
class AlarmClockRouter extends _i11.PageRouteInfo<void> {
  const AlarmClockRouter({List<_i11.PageRouteInfo>? children})
      : super(
          AlarmClockRouter.name,
          path: 'alarm-clock-router',
          initialChildren: children,
        );

  static const String name = 'AlarmClockRouter';
}

/// generated route for
/// [_i3.StopwatchRouter]
class StopwatchRouter extends _i11.PageRouteInfo<void> {
  const StopwatchRouter({List<_i11.PageRouteInfo>? children})
      : super(
          StopwatchRouter.name,
          path: 'stopwatchRouter',
          initialChildren: children,
        );

  static const String name = 'StopwatchRouter';
}

/// generated route for
/// [_i4.TimerRouter]
class TimerRouter extends _i11.PageRouteInfo<void> {
  const TimerRouter({List<_i11.PageRouteInfo>? children})
      : super(
          TimerRouter.name,
          path: 'timerClockRouter',
          initialChildren: children,
        );

  static const String name = 'TimerRouter';
}

/// generated route for
/// [_i5.SettingsScreen]
class SettingsPage extends _i11.PageRouteInfo<void> {
  const SettingsPage()
      : super(
          SettingsPage.name,
          path: 'settings-screen',
        );

  static const String name = 'SettingsPage';
}

/// generated route for
/// [_i6.AlarmClockScreen]
class AlarmClockPage extends _i11.PageRouteInfo<void> {
  const AlarmClockPage()
      : super(
          AlarmClockPage.name,
          path: '',
        );

  static const String name = 'AlarmClockPage';
}

/// generated route for
/// [_i7.AddAlarmScreen]
class AddAlarmPage extends _i11.PageRouteInfo<void> {
  const AddAlarmPage()
      : super(
          AddAlarmPage.name,
          path: 'addAlarmScreen',
        );

  static const String name = 'AddAlarmPage';
}

/// generated route for
/// [_i8.ChangeAlarmScreen]
class ChangeAlarmPage extends _i11.PageRouteInfo<ChangeAlarmPageArgs> {
  ChangeAlarmPage({
    _i12.Key? key,
    required int id,
    required String name,
    required DateTime time,
    required _i13.RepetitionType repetition,
    required bool isOn,
  }) : super(
          ChangeAlarmPage.name,
          path: 'changeAlarmScreen',
          args: ChangeAlarmPageArgs(
            key: key,
            id: id,
            name: name,
            time: time,
            repetition: repetition,
            isOn: isOn,
          ),
        );

  static const String name = 'ChangeAlarmPage';
}

class ChangeAlarmPageArgs {
  const ChangeAlarmPageArgs({
    this.key,
    required this.id,
    required this.name,
    required this.time,
    required this.repetition,
    required this.isOn,
  });

  final _i12.Key? key;

  final int id;

  final String name;

  final DateTime time;

  final _i13.RepetitionType repetition;

  final bool isOn;

  @override
  String toString() {
    return 'ChangeAlarmPageArgs{key: $key, id: $id, name: $name, time: $time, repetition: $repetition, isOn: $isOn}';
  }
}

/// generated route for
/// [_i9.StopwatchScreen]
class StopwatchPage extends _i11.PageRouteInfo<void> {
  const StopwatchPage()
      : super(
          StopwatchPage.name,
          path: '',
        );

  static const String name = 'StopwatchPage';
}

/// generated route for
/// [_i10.TimerScreen]
class TimerPage extends _i11.PageRouteInfo<void> {
  const TimerPage()
      : super(
          TimerPage.name,
          path: '',
        );

  static const String name = 'TimerPage';
}
