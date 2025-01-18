abstract class Observer {
  void update(String notificationMessage);
}

class NotificationSubject {
  final List<Observer> _observers = [];

  void addObserver(Observer observer) {
    _observers.add(observer);
  }

  void removeObserver(Observer observer) {
    _observers.remove(observer);
  }

  void notifyObservers(String notificationMessage) {
    for (final observer in _observers) {
      observer.update(notificationMessage);
    }
  }
}


