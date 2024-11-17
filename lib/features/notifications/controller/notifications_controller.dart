//Notifications controller
import '../model/observer.dart';

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