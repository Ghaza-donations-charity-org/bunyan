import 'package:flutter/material.dart';
import '../common_model/user_model.dart';

class UserControllerProvider extends ChangeNotifier{
  final UserModel user;
  // Getter for user points
  int get points => user.points;
  //todo: get current user id and as docs as whole
  //todo: firestore services folder responsible for manipulating user data (points)

  UserControllerProvider({required this.user});

  void autoUpdatePoints(int amount, String triggerKey) {
    try {
      user.autoUpdatePoints(amount, triggerKey);
    } catch (e) {
      print("Error: ${e.toString()}");
    }
  }

  void manipulatePoints(int amount, String verifier) {
    try {
      user.manipulatePoints(amount, verifier);
    } catch (e) {
      print("Error: ${e.toString()}");
    }
  }

  // Load user points
  Future<void> loadUserPoints() async {
    try {
      await user.loadPoints(); // Load points from the model
      notifyListeners(); // Notify the view about state changes
    } catch (e) {
      print("Error loading user points: ${e.toString()}");
    }
  }
  // Bookmark an event
  Future<void> bookmarkEvent(String eventId) async {
    try {
      await user.bookmarkEvent(eventId); // Delegate to the model
      notifyListeners(); // Notify listeners after state update
    } catch (e) {
      print("Error bookmarking event: ${e.toString()}");
    }
  }

  // Mark an event as going
  Future<void> attendEvent(String eventId) async {
    try {
      await user.attendEvent(eventId); // Delegate to the model
      notifyListeners(); // Notify listeners after state update
    } catch (e) {
      print("Error marking event as going: ${e.toString()}");
    }
  }
}
