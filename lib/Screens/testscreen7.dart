import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pill_reminder_system/Screens/reminderscreen.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class HomeNewPage7 extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  HomeNewPage7(this.navigatorKey);
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> _scheduleAlarm(BuildContext context) async {
    tz.initializeTimeZones();
    var now = tz.TZDateTime.now(tz.local);
    var scheduledTime = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      19, // Hour (7:00 PM)
      29,  // Minute
      0,  // Second
    );
    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(Duration(days: 1));
    }

    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    final dynamic selectNotificationCallback = (String? payload) async {
      navigatorKey.currentState!.pushReplacement(
        MaterialPageRoute(builder: (context) {
          return ReminderScreen2Page();
        }),
      );
    };

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'alarm_channel',
      'Alarm Channel',
      'Channel for Alarm notifications',
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
      enableVibration: true,
      sound: RawResourceAndroidNotificationSound('alarm_sound'),
      showWhen: false,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.initialize(
      InitializationSettings(
        android: AndroidInitializationSettings('app_icon'),
      ),
      onSelectNotification: selectNotificationCallback,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Alarm',
      'This is the alarm notification',
      scheduledTime,
      platformChannelSpecifics,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: 'Alarm payload',
    );

    print('Alarm scheduled for $scheduledTime');
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Alarm App'),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text('Schedule Alarm'),
            onPressed: () {
              _scheduleAlarm(context);
            },
          ),
        ),
      ),
    );
  }
}
