import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

class PushNotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    NotificationSettings settings = await _messaging.requestPermission();
    debugPrint("Notification Permission: ${settings.authorizationStatus}");
  }

  Future<String?> getDeviceToken() async {
    return await _messaging.getToken();
  }

  void subscribeToTopic(String topic) {
    _messaging.subscribeToTopic(topic);
  }

  void unsubscribeFromTopic(String topic) {
    _messaging.unsubscribeFromTopic(topic);
  }

  void onMessageReceived(Function(RemoteMessage) onMessage) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      onMessage(message);
    });
  }

  void onMessageOpenedApp(Function(RemoteMessage) onMessage) {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      onMessage(message);
    });
  }

  void onBackgroundMessage(Function(RemoteMessage) onMessage) {
    FirebaseMessaging.onBackgroundMessage((message) async {
      onMessage(message);
    });
  }


}