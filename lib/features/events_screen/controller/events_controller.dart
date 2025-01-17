import 'package:flutter/material.dart';
import '../model/event.dart';
import '../model/events_dummy_data.dart';

class EventController extends ChangeNotifier {
  final List<Event> _events = dummyEvents; // Remains final

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

  Future<void> loadEvents() async {
    final fetchedEvents = await Event.fetchAllEvents();
    _events.clear(); // Clear existing list
    _events.addAll(fetchedEvents); // Add new items to the list
    notifyListeners();
  }

  Future<void> addEvent(Event event) async {
    await Event.addEvent(event);
    await loadEvents(); // Refresh the list
  }

  Future<void> updateEvent(Event event) async {
    await Event.updateEvent(event);
    await loadEvents(); // Refresh the list
  }

  Future<void> deleteEvent(String eventId) async {
    await Event.deleteEvent(eventId);
    await loadEvents(); // Refresh the list
  }
}
