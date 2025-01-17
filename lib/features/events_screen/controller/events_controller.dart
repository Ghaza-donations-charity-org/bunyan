// import 'package:flutter/material.dart';
// import '../model/event.dart';
// import '../model/events_dummy_data.dart';
//
// class EventController extends ChangeNotifier {
//   final List<Event> _events = dummyEvents; // Remains final
//
//   List<Event> get events => _events;
//
//   void toggleBookmark(String eventId) {
//     final event = _events.firstWhere((event) => event.id == eventId);
//     event.toggleBookmark();
//     notifyListeners(); // Notify the View (UI) to refresh
//   }
//
//   void toggleGoingStatus(String eventId) {
//     final event = _events.firstWhere((event) => event.id == eventId);
//     event.toggleGoingStatus();
//     notifyListeners(); // Notify the View (UI) to refresh
//   }
//
//   Future<void> loadEvents() async {
//     final fetchedEvents = await Event.fetchAllEvents();
//     _events.clear(); // Clear existing list
//     _events.addAll(fetchedEvents); // Add new items to the list
//     notifyListeners();
//   }
//
//   Future<void> addEvent(Event event) async {
//     await Event.addEvent(event);
//     await loadEvents(); // Refresh the list
//   }
//
//   Future<void> updateEvent(Event event) async {
//     await Event.updateEvent(event);
//     await loadEvents(); // Refresh the list
//   }
//
//   Future<void> deleteEvent(String eventId) async {
//     await Event.deleteEvent(eventId);
//     await loadEvents(); // Refresh the list
//   }
// }

import 'package:flutter/material.dart';
import '../../../common_mvc/common_model/firebase_models/firebase_facade.dart';
import '../model/event.dart';

class EventController extends ChangeNotifier {
  final List<Event> _events = []; // Initially empty, loaded from Firestore
  final FirebaseFacade _firebaseFacade = FirebaseFacade(); // Firebase Facade instance

  List<Event> get events => _events;

  Future<void> loadEvents() async {
    try {
      // Fetch data from Firestore
      final rawEvents = await _firebaseFacade.getDataFromFirestore('events');

      // Clear existing events
      _events.clear();

      // Iterate over rawEvents and map them to Event objects
      _events.addAll(
        rawEvents.map((doc) {
          final id = doc['id'] ?? ''; // Safely get the ID
          final eventData = doc; // Safely map the document fields
          return Event.fromFirestoreMap(id, eventData);
        }),
      );

      notifyListeners(); // Notify UI to refresh
    } catch (error) {
      // Log the error for debugging
      debugPrint('Error loading events: $error');
    }
  }


  // Add a new event to Firestore
  Future<void> addEvent(Event event) async {
    try {
      await _firebaseFacade.saveDataToFirestore('events', event.toFirestoreMap());
      await loadEvents(); // Refresh the list
    } catch (error) {
      // Handle errors
      debugPrint('Error adding event: $error');
    }
  }

  // Update an existing event in Firestore
  Future<void> updateEvent(Event event) async {
    try {
      await _firebaseFacade.updateDocumentInFirestore('events', event.id, event.toFirestoreMap());
      await loadEvents(); // Refresh the list
    } catch (error) {
      // Handle errors
      debugPrint('Error updating event: $error');
    }
  }

  // Delete an event from Firestore
  Future<void> deleteEvent(String eventId) async {
    try {
      await _firebaseFacade.deleteDocumentFromFirestore('events', eventId);
      await loadEvents(); // Refresh the list
    } catch (error) {
      // Handle errors
      debugPrint('Error deleting event: $error');
    }
  }

  // Toggle bookmark status and update Firestore
  Future<void> toggleBookmark(String eventId) async {
    try {
      final event = _events.firstWhere((event) => event.id == eventId);
      event.toggleBookmark();
      await _firebaseFacade.updateDocumentInFirestore('events', event.id, event.toFirestoreMap());
      notifyListeners(); // Notify the UI to refresh
    } catch (error) {
      // Handle errors
      debugPrint('Error toggling bookmark: $error');
    }
  }

  // Toggle going status and update Firestore
  Future<void> toggleGoingStatus(String eventId) async {
    try {
      final event = _events.firstWhere((event) => event.id == eventId);
      event.toggleGoingStatus();
      await _firebaseFacade.updateDocumentInFirestore('events', event.id, event.toFirestoreMap());
      notifyListeners(); // Notify the UI to refresh
    } catch (error) {
      // Handle errors
      debugPrint('Error toggling going status: $error');
    }
  }
}
