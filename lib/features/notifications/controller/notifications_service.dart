import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/theme/app_colors.dart';
import 'package:ghaza_donations_app/main.dart';

class NotificationService {
  static Future<void> initializeNotification() async {
    await AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
            channelGroupKey: "Basic_channel_group",
            channelKey: "basic_channel",
            channelName: "basic_notifications",
            channelDescription: "channelDescription",
            defaultColor: AppColors.backgroundWhite,
            ledColor: AppColors.navyBlue,
            importance: NotificationImportance.Max,
            channelShowBadge: true,
            onlyAlertOnce: true,
            playSound: true,
            criticalAlerts: true,
          )
        ],
        channelGroups: [
          NotificationChannelGroup(
              channelGroupKey: "Basic_channel_group",
              channelGroupName: "basic_status_change_notifications")
        ],
        debug: true);
    bool isAllowedToSendNotifications =
        await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowedToSendNotifications) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
    await AwesomeNotifications().setListeners(
        onActionReceivedMethod: onActionReceivedMethod,
        onDismissActionReceivedMethod: onDismissActionReceivedMethod,
        onNotificationCreatedMethod: onNotificationCreatedMethod,
        onNotificationDisplayedMethod: onNotificationDisplayedMethod);
    // FirestoreGiftListener().startListening();
  }

  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    print("Notification created: ${receivedNotification.title}");
  }

  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    print("Notification displayed: ${receivedNotification.title}");
  }

  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedNotification receivedNotification) async {
    print("Notification dismissed: ${receivedNotification.title}");
  }

  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedNotification receivedNotification) async {
    print(
        "Notification action clicked and this happens : ${receivedNotification.title}");
    final payload = receivedNotification.payload ?? {};
    if (payload["navigate"] == "true") {
      MyApp.navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (_) => Container(),
        )
      );
    }
  }
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
    final bool scheduled = false,
    final int? interval,
  }) async {
    assert(!scheduled || (scheduled && interval != null),
    'If scheduled is true, interval must not be null.');

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: 'basic_channel', // Update with your channel key
        title: title,
        body: body,
        summary: summary,
        bigPicture: bigPicture,
        notificationLayout: notificationLayout,
        category: category,
        payload: payload,
      ),
      actionButtons: actionButtons,
      schedule: scheduled
          ? NotificationInterval(
        interval: Duration(seconds: interval!),
        timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier(),
        preciseAlarm: true,
      )
          : null,
    );
  }

  static int createUniqueId() {
    return DateTime.now().millisecondsSinceEpoch.remainder(100000);
  }

}
