import 'package:uuid/uuid.dart';
import '../../../common_mvc/common_model/firebase_models/firebase_facade.dart';

class Event {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  List<String> bookmarkedBy; // List of user IDs who bookmarked the event
  List<String> attending; // List of user IDs who are attending the event

  Event({
    String? id,
    required this.title,
    required this.description,
    required this.imageUrl,
    List<String>? bookmarkedBy,
    List<String>? attending,
  })  : id = id ?? const Uuid().v4(),
        bookmarkedBy = bookmarkedBy ?? [],
        attending = attending ?? [];

  // Firestore collection name
  static const String collectionName = "events";

  // Convert Event to Firestore-compatible map
  Map<String, dynamic> toFirestoreMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'bookmarkedBy': bookmarkedBy,
      'attending': attending,
    };
  }

  // Create an Event instance from Firestore map
  factory Event.fromFirestoreMap(String id, Map<String, dynamic> map) {
    return Event(
      id: id,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      bookmarkedBy: List<String>.from(map['bookmarkedBy'] ?? []),
      attending: List<String>.from(map['attending'] ?? []),
    );
  }

  void toggleBookmark(String userId) {
    if (bookmarkedBy.contains(userId)) {
      bookmarkedBy.remove(userId); // User is removing the bookmark
    } else {
      bookmarkedBy.add(userId); // User is bookmarking the event
    }
  }

  void toggleAttending(String userId) {
    if (attending.contains(userId)) {
      attending.remove(userId); // User is no longer attending
    } else {
      attending.add(userId); // User is attending the event
    }
  }

  // Event-specific CRUD operations
  static Future<void> addEvent(Event event) async {
    await FirebaseFacade().saveDataToFirestore(collectionName, event.toFirestoreMap());
  }

  static Future<List<Event>> fetchAllEvents() async {
    final data = await FirebaseFacade().getDataFromFirestore(collectionName);
    return data.map((doc) => Event.fromFirestoreMap(doc['id'], doc)).toList();
  }

  static Future<Event?> fetchEventById(String eventId) async {
    final data = await FirebaseFacade().getDocumentByIdFromFirestore(collectionName, eventId);
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
