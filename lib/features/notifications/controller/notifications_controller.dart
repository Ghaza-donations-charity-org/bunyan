//Notifications controller
import '../model/observer.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationManager {
  final List<Observer> _observers = [];

  void addObserver(Observer observer) {
    _observers.add(observer);
  }

  void removeObserver(Observer observer) {
    _observers.remove(observer);
  }

  void notifyObservers(String notificationMessage) {
    for (Observer observer in _observers) {
      observer.update(notificationMessage);
    }
  }

  // Simulate receiving a new notification (for testing)
  void newNotification(String message) {
    notifyObservers(message);
  }
}

class NotificationController {
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(ReceivedNotification receivedNotification) async {
    print("Notification created: ${receivedNotification.title}");
  }

  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(ReceivedNotification receivedNotification) async {
    print("Notification displayed: ${receivedNotification.title}");
  }

  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(ReceivedNotification receivedNotification) async {
    print("Notification dismissed: ${receivedNotification.title}");
  }

  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(ReceivedNotification receivedNotification) async {
    print("Notification action clicked and this happens : ${receivedNotification.title}");
  }
}
