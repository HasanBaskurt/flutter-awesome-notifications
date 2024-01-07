import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationServices {
  static Future<void> initializeNotification() async {
    // Notification Initialize
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelKey: 'app_notification_channel',
            channelName: 'App Notification Chanel',
            channelDescription: 'This channel is test notifications.',
            importance: NotificationImportance.Max,
            defaultRingtoneType: DefaultRingtoneType.Notification,
            enableVibration: true,
            playSound: true,
            channelShowBadge: true,
            onlyAlertOnce: true,
            criticalAlerts: true),
      ],
    );

    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
      onNotificationCreatedMethod: onNotificationCreatedMethod,
      onNotificationDisplayedMethod: onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    );

    // Notification Permission
    await AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) {
        if (!isAllowed) {
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
      },
    );
  }

  // When There is a action
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    debugPrint('receivedNotification');
  }

  // When Created Notification
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    debugPrint('onNotificationCreatedMethod');
  }

  // When display notification
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    debugPrint('onNotificationDisplayedMethod');
  }

  // when close the notification
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    debugPrint('onDismissActionReceivedMethod');
  }

  // Show Notification
  static Future<void> showNotification({
    required final String title,
    required final String body,
    final String? summary,
    final Map<String, String>? payload,
    final ActionType actionType = ActionType.Default,
    final NotificationLayout notificationLayout = NotificationLayout.Default,
    final NotificationCategory? category,
    final String? bigPicture,
    final List<NotificationActionButton>? actionButtons,
    final bool schedule = false,
    final DateTime? date,
    final Color? color,
    final Color? backgroundColor,
  }) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: -1,
            channelKey: "app_notification_channel",
            title: title,
            body: body,
            actionType: actionType,
            notificationLayout: notificationLayout,
            summary: summary,
            category: category,
            payload: payload,
            color: color,
            backgroundColor: backgroundColor,
            bigPicture: bigPicture),
        actionButtons: actionButtons,
        schedule: schedule && date != null
            ? NotificationCalendar(
                second: date.second,
                minute: date.minute,
                hour: date.hour,
                day: date.day,
                month: date.month,
                year: date.year,
              )
            : null);
  }
}
