import 'package:flutter/cupertino.dart';
import 'package:ghaza_donations_app/features/events_screen/model/events_dummy_data.dart';
import '../model/event.dart';

class EventAdminController extends ChangeNotifier{
  final List<Event> _events = dummyEvents;

  List<Event> get events => _events;

  void addEvent(Event event) {
    _events.add(event);
    notifyListeners();
  }
}
