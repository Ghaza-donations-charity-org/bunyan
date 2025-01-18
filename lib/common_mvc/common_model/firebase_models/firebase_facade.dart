import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../../features/authentication/model/firebase_auth_singleton.dart';
import '../../../features/notifications/model/push_notification_services.dart';

import 'firestore_services.dart';


class FirebaseFacade {
  // Singleton instance
  static final FirebaseFacade _instance = FirebaseFacade._internal();

  // Factory constructor
  factory FirebaseFacade() {
    return _instance;
  }

  // Private constructor
  FirebaseFacade._internal();

  // Internal services
  final FirebaseAuthServices _authService = FirebaseAuthServices();
  final FireStoreServices _firestoreService = FireStoreServices();
  final PushNotificationService _notificationService = PushNotificationService();

  // Initialization
  Future<void> initialize() async {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp();
    }
    await _notificationService.initialize();
  }

  // Facade Methods
  // Authentication Methods
  User? getCurrentUser() => _authService.currentUser;

  String getCurrentUserId() {
    final user = getCurrentUser();
    if (user == null) {
      throw Exception("No authenticated user found.");
    }
    return user.uid;
  }

  Future<void> signOut() => _authService.signOut();

// Firestore Methods
  Future<void> saveDataToFirestore(String collection, Map<String, dynamic> data) {
    return _firestoreService.addData(collection, data);
  }

  Future<List<Map<String, dynamic>>> getDataFromFirestore(String collection) {
    return _firestoreService.getData(collection);
  }

  Future<void> updateDocumentInFirestore(
      String collection, String docId, Map<String, dynamic> data) {
    return _firestoreService.updateDocument(collection, docId, data);
  }

  Future<Map<String, dynamic>?> getDocumentByIdFromFirestore(String collection, String docId) {
    return _firestoreService.getDocumentById(collection, docId);
  }

  Future<void> deleteDocumentFromFirestore(String collection, String docId) {
    return _firestoreService.deleteDocument(collection, docId);
  }

  // Add user ID to event's bookmarkedBy list
  Future<void> addUserToEventBookmarkList(String eventId, String userId) async {
    final eventData = await getDocumentByIdFromFirestore('events', eventId);
    if (eventData != null) {
      List<String> bookmarkedBy = List<String>.from(eventData['bookmarkedBy'] ?? []);
      if (!bookmarkedBy.contains(userId)) {
        bookmarkedBy.add(userId);
        await updateDocumentInFirestore('events', eventId, {'bookmarkedBy': bookmarkedBy});
      }
    }
  }

  // Add user ID to event's attending list
  Future<void> addUserToEventAttendingList(String eventId, String userId) async {
    final eventData = await getDocumentByIdFromFirestore('events', eventId);
    if (eventData != null) {
      List<String> attending = List<String>.from(eventData['attending'] ?? []);
      if (!attending.contains(userId)) {
        attending.add(userId);
        await updateDocumentInFirestore('events', eventId, {'attending': attending});
      }
    }
  }
}