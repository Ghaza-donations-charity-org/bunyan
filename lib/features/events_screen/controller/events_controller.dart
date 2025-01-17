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
//
// I wanna implement the events CRUD firebase operations following the same structure as (abstract interface facade and firebase services file having the generic methods and the event model using the facade in events specific crud operations) import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import '../../../features/authentication/model/firebase_auth_singleton.dart';
// import '../../../features/notifications/model/push_notification_services.dart';
//
// import 'firestore_services.dart';
//
//
// class FirebaseFacade {
// // Singleton instance
// static final FirebaseFacade _instance = FirebaseFacade._internal();
//
// // Factory constructor
// factory FirebaseFacade() {
// return _instance;
// }
//
// // Private constructor
// FirebaseFacade._internal();
//
// // Internal services
// final FirebaseAuthServices _authService = FirebaseAuthServices();
// final FireStoreServices _firestoreService = FireStoreServices();
// final PushNotificationService _notificationService = PushNotificationService();
//
// // Initialization
// Future<void> initialize() async {
// if (Firebase.apps.isEmpty) {
// await Firebase.initializeApp();
// }
// await _notificationService.initialize();
// }
//
// // Facade Methods
// // Authentication Methods
// User? getCurrentUser() => _authService.currentUser;
//
// String getCurrentUserId() {
// final user = getCurrentUser();
// if (user == null) {
// throw Exception("No authenticated user found.");
// }
// return user.uid;
// }
//
// Future<void> signOut() => _authService.signOut();
//
// // Firestore Methods
// Future<void> saveDataToFirestore(String collection, Map<String, dynamic> data) {
// return _firestoreService.addData(collection, data);
// }
//
// Future<List<Map<String, dynamic>>> getDataFromFirestore(String collection) {
// return _firestoreService.getData(collection);
// }
//
// Future<void> updateDocumentInFirestore(
// String collection, String docId, Map<String, dynamic> data) {
// return _firestoreService.updateDocument(collection, docId, data);
// }
//
// Future<Map<String, dynamic>?> getDocumentByIdFromFirestore(String collection, String docId) {
// return _firestoreService.getDocumentById(collection, docId);
// }
//
// Future<void> deleteDocumentFromFirestore(String collection, String docId) {
// return _firestoreService.deleteDocument(collection, docId);
// }
// } import 'package:cloud_firestore/cloud_firestore.dart';
//
// class FireStoreServices {
// final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
// Future<void> addData(String collection, Map<String, dynamic> data) async {
// await _firestore.collection(collection).add(data);
// }
//
// Future<List<Map<String, dynamic>>> getData(String collection) async {
// QuerySnapshot snapshot = await _firestore.collection(collection).get();
// return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
// }
//
// Future<void> updateDocument(String collection, String docId, Map<String, dynamic> data) async {
// await _firestore.collection(collection).doc(docId).update(data);
// }
//
// Future<Map<String, dynamic>?> getDocumentById(String collection, String docId) async {
// final docSnapshot = await _firestore.collection(collection).doc(docId).get();
// return docSnapshot.exists ? docSnapshot.data() : null;
// }
//
// Future<void> deleteDocument(String collection, String docId) async {
// await _firestore.collection(collection).doc(docId).delete();
// }
// } class Event {
// final String id;
// final String title;
// final String description;
// final String imageUrl;
// bool isBookmarked;
// bool isGoing;
//
// Event({
// required this.id,
// required this.title,
// required this.description,
// required this.imageUrl,
// this.isBookmarked = false,
// this.isGoing = false,
// });
//
// void toggleBookmark() {
// isBookmarked = !isBookmarked;
// }
//
// void toggleGoingStatus() {
// isGoing = !isGoing;
// }
//}