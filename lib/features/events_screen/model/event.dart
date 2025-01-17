import 'package:uuid/uuid.dart';

import '../../../common_mvc/common_model/firebase_models/firebase_facade.dart';

class Event {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  bool isBookmarked;
  bool isGoing;

  Event({
    String? id,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.isBookmarked = false,
    this.isGoing = false,
  }) : id = id ?? const Uuid().v4();

  // Firestore collection name
  static const String collectionName = "events";

  // Convert Event to Firestore-compatible map
  Map<String, dynamic> toFirestoreMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'isBookmarked': isBookmarked,
      'isGoing': isGoing,
    };
  }

  // Create an Event instance from Firestore map
  factory Event.fromFirestoreMap(String id, Map<String, dynamic> map) {
    return Event(
      id: id,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      isBookmarked: map['isBookmarked'] ?? false,
      isGoing: map['isGoing'] ?? false,
    );
  }

  void toggleBookmark() {
    isBookmarked = !isBookmarked;
  }

  void toggleGoingStatus() {
    isGoing = !isGoing;
  }

  // Event-specific CRUD operations
  static Future<void> addEvent(Event event) async {
    await FirebaseFacade()
        .saveDataToFirestore(collectionName, event.toFirestoreMap());
  }

  static Future<List<Event>> fetchAllEvents() async {
    final data = await FirebaseFacade().getDataFromFirestore(collectionName);
    return data.map((doc) => Event.fromFirestoreMap(doc['id'], doc)).toList();
  }

  static Future<Event?> fetchEventById(String eventId) async {
    final data = await FirebaseFacade()
        .getDocumentByIdFromFirestore(collectionName, eventId);
    return data != null ? Event.fromFirestoreMap(eventId, data) : null;
  }

  static Future<void> updateEvent(Event event) async {
    await FirebaseFacade().updateDocumentInFirestore(
        collectionName, event.id, event.toFirestoreMap());
  }

  static Future<void> deleteEvent(String eventId) async {
    await FirebaseFacade().deleteDocumentFromFirestore(collectionName, eventId);
  }
}
