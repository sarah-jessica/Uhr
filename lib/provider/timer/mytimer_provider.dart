import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:uhr/services/notification_service.dart';

class MyTimer extends ChangeNotifier {
  DateTime setTime = DateTime(0, 0, 0, 0, 0, 0);

  StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
    onEnded: () => NotificationService().timerScreenNotification(999, 'Timer expired', ''),
  );

  bool _isPaused = false;

  bool get isRunning => _stopWatchTimer.isRunning;
  bool get isPaused => _isPaused;
  dynamic get rawTime => _stopWatchTimer.rawTime;
  int get rawTimeValue => _stopWatchTimer.rawTime.value;

  void start () {
    if (_isPaused) {
      _stopWatchTimer.onStartTimer();
      _isPaused = false;
    } else {
      _stopWatchTimer = StopWatchTimer(
        mode: StopWatchMode.countDown,
        onEnded: () => NotificationService().timerScreenNotification(999, 'Timer expired', ''),
      );
      _stopWatchTimer.setPresetHoursTime(setTime.hour);
      _stopWatchTimer.setPresetMinuteTime(setTime.minute);
      _stopWatchTimer.setPresetSecondTime(setTime.second);
      _stopWatchTimer.onStartTimer();
      notifyListeners();
    }
  }

  void pause () {
    _stopWatchTimer.onStopTimer();
    _isPaused = true;
  }

  void stop () {
    _stopWatchTimer.onStopTimer();
    _isPaused = false;
    notifyListeners();
  }

}
