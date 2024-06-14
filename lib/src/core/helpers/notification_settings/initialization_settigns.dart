import 'package:flutter_local_notifications/flutter_local_notifications.dart';

base mixin class NotificationSettings {
  NotificationSettings._instance();

  static NotificationSettings instance = NotificationSettings._instance();

  static const _androidInitializationSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  static const _iosInitializationSettings = DarwinInitializationSettings();

  final _initializationSettings = const InitializationSettings(
      android: _androidInitializationSettings, iOS: _iosInitializationSettings);

  final localNotificationPlugin = FlutterLocalNotificationsPlugin();

  Future<bool?> notificationInitialize() async {
    try {
      return await localNotificationPlugin.initialize(_initializationSettings);
    } on Object catch (error, stack) {
      Error.throwWithStackTrace(error, stack);
    }
  }
}
