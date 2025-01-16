import 'package:flutter/material.dart';
import '../model/event.dart';
import '../model/events_dummy_data.dart';


class EventController extends ChangeNotifier {
  final List<Event> _events = dummyEvents;

  List<Event> get events => _events;

  void toggleBookmark(String eventId) {
    final event = _events.firstWhere((event) => event.id == eventId);
    event.toggleBookmark();
    notifyListeners(); // Notify the View (UI) to refresh
  }

  void toggleGoingStatus(String eventId) {
    final event = _events.firstWhere((event) => event.id == eventId);
    event.toggleGoingStatus();
    notifyListeners(); // Notify the View (UI) to refresh
  }
}
