import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:uhr/services/notification_service.dart';

class MyTimer {
  DateTime setTime = DateTime(0, 0, 0,);

  StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
    onEnded: () => NotificationService().timerNotification(999, 'Timer expired', ''),
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
        onEnded: () => NotificationService().timerNotification(999, 'Timer expired', ''),
      );
      _stopWatchTimer..setPresetHoursTime(setTime.hour)
      ..setPresetMinuteTime(setTime.minute)
      ..setPresetSecondTime(setTime.second)
      ..onStartTimer();
    }
  }

  void pause () {
    _stopWatchTimer.onStopTimer();
    _isPaused = true;
  }

  void stop () {
    _stopWatchTimer.onStopTimer();
    _isPaused = false;
  }

}
