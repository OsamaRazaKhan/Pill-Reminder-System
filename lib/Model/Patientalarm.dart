import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:pill_reminder_system/Screens/alarmscreen2.dart';
// ignore: unused_import
import 'package:pill_reminder_system/Screens/reminderscreen.dart';
import 'package:pill_reminder_system/Utilities/Global/global.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class Alarm2 {
  final GlobalKey<NavigatorState> navigatorKey;
  int patient_id;
  String? dayName, time;
  Widget w1;
  Alarm2(this.navigatorKey, this.patient_id, this.w1);
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> cancelAlarm() async {
    // Cancel the scheduled alarm
    await flutterLocalNotificationsPlugin.cancel(0);

    // Clear the scheduled time from shared preferences
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.remove('scheduledTime');
    print('Alarm canceled');
  }

  Future<void> scheduleAlarm() async {
    fnplugin = flutterLocalNotificationsPlugin;
    var scheduledTime;

    var now2 = DateTime.now();
    var formatter = DateFormat('EEEE');
    dayName = formatter.format(now2);
    print(dayName);
    tz.initializeTimeZones();
    // var scheduledTime = tz.TZDateTime.now(tz.local).add(Duration(seconds: 5));
    print(tz.local);
    var now = tz.TZDateTime.now(tz.local);
    print('current time+$now');

    if (is_snooze == false) {
      if (now.hour < 3) {
        scheduledTime = tz.TZDateTime(
          tz.local,
          now.year,
          now.month,
          now.day,
          3, // Hour (8:00 AM)
          0, // Minute
          0, // Second
        );
        time = "morn";
      } else if (now.hour < 8) {
        scheduledTime = tz.TZDateTime(
          tz.local,
          now.year,
          now.month,
          now.day,
          8, // Hour (1:00 PM)
          0, // Minute
          0, // Second
        );
        time = "noon";
      } else if (now.hour < 13) {
        scheduledTime = tz.TZDateTime(
          tz.local,
          now.year,
          now.month,
          now.day,
          9, // Hour (6:00 PM)
          22, // Minute
          0, // Second
        );
        time = "even";
      } else if (now.hour < 17) {
        scheduledTime = tz.TZDateTime(
          tz.local,
          now.year,
          now.month,
          now.day,
          17, // Hour (10:00 PM)
          0, // Minute
          0, // Second
        );
        time = "night";
      } else {
        // If the current time is past 10 pm, schedule the alarm for the next day
        scheduledTime = tz.TZDateTime(
          tz.local,
          now.year,
          now.month,
          now.day + 1,
          3, // Hour (8:00 AM)
          0, // Minute
          0, // Second
        );
        time = "morn";
      }
    } else if (is_snooze == true) {
      int hour = now.hour;
      print('now.hour is $hour');
      if (now.hour < 8 && now.hour >= 3)
        time = "morn";
      else if (now.hour < 13 && now.hour >= 8)
        time = "noon";
      else if (now.hour < 17 && now.hour >= 13)
        time = "even";
      else if (now.hour < 3 || now.hour >= 17) time = "night";
      print('this is else case $time');
      scheduledTime = tz.TZDateTime.from(
          DateTime.now().add(Duration(seconds: 10)), tz.local);
    }

    print('scheduled time+$scheduledTime');
    //  if (scheduledTime.isBefore(now)) {
    //  scheduledTime = scheduledTime.add(Duration(days: 1));
    //   }
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    final Future<dynamic> Function(String?)? selectNotificationCallback =
        (String? payload) async {
      navigatorKey.currentState!.pushReplacement(
        MaterialPageRoute(builder: (context) {
          return AlarmScreen2.Cons1(patient_id, w1, dayName!, time!,
              navigatorKey); // Replace with your custom alarm screen
        }),
      );
      //navigatorKey.currentState!.pop();
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
}
