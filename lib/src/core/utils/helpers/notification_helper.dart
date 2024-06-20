import 'dart:math';

import 'package:antiradar/src/core/utils/helpers/notification_settings/initialization_settigns.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'notification_settings/notification_details.dart';

base mixin class NotificationHelper {
  static Future<void> createNotification(int speedLimit, int speed) async {
    try {
      /// Notification settings.
      const notificationDetails = AppNotificationDetails.notificationDetails;

      /// Show notification notification.
      await NotificationSettings.instance.localNotificationPlugin.show(
          0, 'Camera $speedLimit', 'SpeedLimit $speed', notificationDetails);
    } on Object catch (error, stack) {
      debugPrintStack(stackTrace: stack, label: 'ERROR: $error');
      Error.throwWithStackTrace(error, stack);
    }
  }
}
