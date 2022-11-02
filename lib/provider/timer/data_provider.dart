import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:uhr/services/notification_service.dart';

// Klasse mit Informationen auf die andere Dateien Zugriff haben sollen

DateTime setTime = DateTime(0, 0, 0, 0, 0, 0);

StopWatchTimer stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
    onEnded: () => NotificationService().timerScreenNotification(999, 'Timer expired', ''),
);

bool isPaused = false;

void resetStopWatchTimer () {
  stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
    onEnded: () => NotificationService().timerScreenNotification(999, 'Timer expired', ''),
  );
}