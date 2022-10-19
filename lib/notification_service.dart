import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

// Klasse um Benachrichtigungen zu erstellen

class NotificationService {
  static final NotificationService _notificationService = NotificationService._internal();


  factory NotificationService() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

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


  Future<void> showNotification(int id, String title, String body, DateTime time, bool rep) async {
    if (rep == false) {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(time, tz.getLocation('Europe/Berlin')),
        const NotificationDetails(
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
        ),
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
      );
    } else {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
          tz.TZDateTime.from(time, tz.getLocation('Europe/Berlin')),
        const NotificationDetails(
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
        ),
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
          matchDateTimeComponents: DateTimeComponents.time
      );
    }
  }

  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  void timerNotification (int id, String title, String body) async {
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      const NotificationDetails(
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
      ),
    );
  }


}