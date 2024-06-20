import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract base class AppNotificationDetails {
  static const _androidNotificationDetails = AndroidNotificationDetails(
    'nearest_id',
    'nearest',
    playSound: true,
    importance: Importance.max,
    priority: Priority.high,
  );

  static const _iosNotificationDetail = DarwinNotificationDetails();

  static const notificationDetails = NotificationDetails(
      android: _androidNotificationDetails, iOS: _iosNotificationDetail);
}
