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

  Future<void> updateDocument(
      String collection, String docId, Map<String, dynamic> data) {
    return _firestoreService.updateDocument(collection, docId, data);
  }

  Future<Map<String, dynamic>?> getDocumentById(String collection, String docId) {
    return _firestoreService.getDocumentById(collection, docId);
  }
}