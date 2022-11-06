import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class LocalNotiService {
  static final _localNotiService = FlutterLocalNotificationsPlugin();
  static const _notiDetails = NotificationDetails(
    android: AndroidNotificationDetails(
      'channel id',
      'channel name',
      channelDescription: 'channel description',
      importance: Importance.max,
    ),
    iOS: DarwinNotificationDetails(),
  );

  static Future<void> initialize({bool isScheduled = false}) async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@drawable/ic_completed_task');

    const DarwinInitializationSettings darwinInitializationSettings =
        DarwinInitializationSettings(
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: androidInitializationSettings,
            iOS: darwinInitializationSettings);

    if (isScheduled) {
      tz.initializeTimeZones();
    }
    await _localNotiService.initialize(initializationSettings);
  }

  static void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    print('id $id');
  }

  static Future<void> showScheduledNotification({
    int id = 0,
    String? title,
    String? body = '10 minutes left to duetime!!!',
    String? payload,
    required DateTime scheduledTime,
  }) async =>
      _localNotiService.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(
            scheduledTime.subtract(const Duration(minutes: 10)), tz.local),
        _notiDetails,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );

  static Future<void> cancelNoti() async {
    await _localNotiService.cancelAll();
  }

  static Future<void> cancelIdentifiedNoti(int id) async {
    await _localNotiService.cancel(id);
  }
}
