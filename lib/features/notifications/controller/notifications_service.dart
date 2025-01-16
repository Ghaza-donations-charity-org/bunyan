import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/theme/app_colors.dart';

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
  }
}
