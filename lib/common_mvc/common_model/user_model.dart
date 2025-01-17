import 'firebase_models/firebase_facade.dart';

class UserModel {
  final FirebaseFacade _firebaseFacade = FirebaseFacade();

  late final String userId;
  late final String email;
  int _points = 0;

  // New attributes for user operations
  List<String> bookmarkedDonationGoals = [];
  List<String> bookmarkedEvents = [];
  List<String> eventsToAttend = [];

  UserModel() {
    userId = _firebaseFacade.getCurrentUserId();
    email = _firebaseFacade.getCurrentUser()?.email ?? 'No email';
    print(userId);
  }

  // Getter for points
  int get points => _points;

  // Private setter for points
  void _setPoints(int points) {
    _points = points;
  }

  // Load user points from Firestore
  Future<void> loadPoints() async {
    try {
      final userData = await _firebaseFacade.getDocumentByIdFromFirestore('users', userId);
      if (userData == null) {
        _setPoints(0);
        await savePoints();
      } else if (userData.containsKey('points')) {
        _setPoints(userData['points']);
      } else {
        throw Exception("Points not found in user data.");
      }
    } catch (e) {
      throw Exception("Error loading points: $e");
    }
  }

  // Save user points to Firestore
  Future<void> savePoints() async {
    try {
      final userPoints = {'points': _points};
      await _firebaseFacade.updateDocumentInFirestore('users', userId, userPoints);
    } catch (e) {
      throw Exception("Error saving points: $e");
    }
  }

  // Check if the verifier is valid
  bool _isAdmin(String verifier) {
    return verifier == "admin_token";
  }

  // Manipulate points with authorization
  Future<void> manipulatePoints(int amount, String verifier) async {
    if (_isAdmin(verifier)) {
      _setPoints(_points + amount);
      await savePoints();
    } else {
      throw Exception("Unauthorized access to manipulate points.");
    }
  }

  // Automatic update points with a trigger key
  Future<void> autoUpdatePoints(int amount, String triggerKey) async {
    if (triggerKey == "autoTriggerKey") {
      _setPoints(_points + amount);
      await savePoints();
    } else {
      throw Exception("Unauthorized access to auto-update points.");
    }
  }

  // Add a user (admin only)
  Future<void> addUser(String userId, String email) async {
      final newUser = {
        'userId': userId,
        'email': email,
        'points': 0,
        'bookmarkedDonationGoals': [],
        'bookmarkedEvents': [],
        'eventsToAttend': [],
      };
      await _firebaseFacade.saveDataToFirestore('users', newUser);
  }

  // Delete a user (admin only)
  Future<void> deleteUser(String userId) async {
    if (_isAdmin("admin_token")) {
      await _firebaseFacade.deleteDocumentFromFirestore('users', userId);
    } else {
      throw Exception("Unauthorized access to delete user.");
    }
  }
  // Bookmark an event
  Future<void> bookmarkEvent(String eventId) async {
    if (!bookmarkedEvents.contains(eventId)) {
      bookmarkedEvents.add(eventId);
      await saveUserAttributes(); // Save updated attributes to Firestore

      // Update event's bookmarkedBy list
      await _firebaseFacade.addUserToEventBookmarkList(eventId, userId);
    }
  }

  // Mark an event as going
  Future<void> attendEvent(String eventId) async {
    if (!eventsToAttend.contains(eventId)) {
      eventsToAttend.add(eventId);
      await saveUserAttributes(); // Save updated attributes to Firestore

      // Update event's attending list
      await _firebaseFacade.addUserToEventAttendingList(eventId, userId);
    }
  }

  // Save user attributes to Firestore
  Future<void> saveUserAttributes() async {
    try {
      final userAttributes = {
        'bookmarkedDonationGoals': bookmarkedDonationGoals,
        'bookmarkedEvents': bookmarkedEvents,
        'eventsToAttend': eventsToAttend,
      };
      await _firebaseFacade.updateDocumentInFirestore('users', userId, userAttributes);
    } catch (e) {
      throw Exception("Error saving user attributes: $e");
    }
  }
}
}
