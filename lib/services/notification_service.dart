import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

// Klasse um Benachrichtigungen zu erstellen

class NotificationService {
  static final NotificationService _notificationService = NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  NotificationService._internal();

  Future<void> initNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
    InitializationSettings(
        android: initializationSettingsAndroid,

    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    tz.initializeTimeZones();
  }

  final notificationDetails = const NotificationDetails(
    android: AndroidNotificationDetails(
      'main_channel',
      'Main Channel',
      importance: Importance.max,
      priority: Priority.max,
      icon: '@mipmap/ic_launcher',
      playSound: true,
      //sound: RawResourceAndroidNotificationSound('alarm_buzzer_experia'),
      enableVibration: true,
    ),
  );


  Future<void> showNotification(int id, String title, String body, DateTime time) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(time, tz.getLocation('Europe/Berlin')),
      notificationDetails,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      matchDateTimeComponents: DateTimeComponents.time
    );
  }

  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  void timerScreenNotification (int id, String title, String body) async {
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
    );
  }


}