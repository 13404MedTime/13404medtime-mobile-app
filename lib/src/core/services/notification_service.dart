import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// ignore: depend_on_referenced_packages
import 'package:timezone/data/latest_all.dart' as tzz;
// ignore: depend_on_referenced_packages
import 'package:timezone/timezone.dart' as tz;

import '../../../firebase_options.dart';
import '../../config/router/app_routes.dart';

late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
InitializationSettings initializationSettings = const InitializationSettings(
  android: AndroidInitializationSettings('@mipmap/ic_launcher'),
  iOS: DarwinInitializationSettings(),
);

Future<void> notificationServiceInitialize() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupFlutterNotifications();
  foregroundNotification();
  backgroundNotification();
  await terminateNotification();
  tzz.initializeTimeZones();
}

Future<void> setupFlutterNotifications() async {
  if (Platform.isIOS) {
    await FirebaseMessaging.instance.requestPermission(
      announcement: true,
    );
  }
  channel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.requestExactAlarmsPermission();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.requestNotificationsPermission();

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
}

void showFlutterNotification(RemoteMessage message) {
  final RemoteNotification? notification = message.notification;
  if (message.data.isNotEmpty && !kIsWeb) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      message.data['title'] ?? '',
      message.data['body'] ?? '',
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          styleInformation: BigTextStyleInformation(
            message.data['body'] ?? '',
            contentTitle: message.data['title'] ?? '',
          ),
          icon: '@mipmap/ic_launcher',
          priority: Priority.high,
          importance: Importance.high,
          visibility: NotificationVisibility.public,
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      payload: Routes.myAppointments,
    );
  }
}

void foregroundNotification() {
  /// When tapped
  flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (response) async {
      debugPrint('foreground notification tapped');
      debugPrint('$response');
      await Navigator.pushNamed(
        rootNavigatorKey.currentContext!,
        Routes.myAppointments,
        arguments: 'notification',
      );
    },
  );
}

void backgroundNotification() {
  // FirebaseMessaging.onMessage.listen(showFlutterNotification);
  FirebaseMessaging.onMessageOpenedApp.listen(
    (message) {
      debugPrint('A new onMessageOpenedApp event was published!');
      showFlutterNotification(message);
    },
  );
}

Future<void> terminateNotification() async {
  final remoteMessage = await FirebaseMessaging.instance.getInitialMessage();
  if (remoteMessage == null) {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  } else {
    showFlutterNotification(remoteMessage);
  }
}

Future<void> scheduleNotification({
  int id = 0,
  String? title,
  String? body,
  String? payLoad,
  required DateTime scheduledNotificationDateTime,
}) async {
  try {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(
        scheduledNotificationDateTime,
        tz.local,
      ),
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          styleInformation: BigTextStyleInformation(
            body ?? '',
            contentTitle: title,
          ),
          icon: '@mipmap/ic_launcher',
          priority: Priority.high,
          importance: Importance.high,
          visibility: NotificationVisibility.public,
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      payload: '/my_appointments',
    );
    debugPrint(
      'notification success added, id:--$id-- $title, $body, ${scheduledNotificationDateTime.toIso8601String()}',
    );
  } on Exception catch (e, s) {
    debugPrint('notification not added, $e,$s');
  }
}

void cancelAllNotifications() {
  flutterLocalNotificationsPlugin.cancelAll();
}

Future<void> cancelNotificationByIds(final List<String> ids) async {
  debugPrint('----- CANCELED NOTIFICATION IDS: $ids');
  await Future.wait(List.generate(
    ids.length,
    (index) => flutterLocalNotificationsPlugin.cancel(ids[index].hashCode),
  ));
}

Future<void> cancelNotificationById(int id) async {
  debugPrint('----- CANCELED NOTIFICATION ID: $id');
  await flutterLocalNotificationsPlugin.cancel(id);
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupFlutterNotifications();
  showFlutterNotification(message);
}
