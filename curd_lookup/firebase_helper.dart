import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelper {
  final FirebaseFirestore firestore;

  FirebaseHelper(this.firestore);

  // Get all lookup items (e.g., donation categories)
  Future<List<Map<String, dynamic>>> getLookupItems(String collectionName) async {
    try {
      QuerySnapshot snapshot = await firestore.collection(collectionName).get();
      return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }

  // Create a new lookup item
  Future<void> addLookupItem(String collectionName, Map<String, dynamic> data) async {
    try {
      await firestore.collection(collectionName).add(data);
    } catch (e) {
      throw Exception('Error adding data: $e');
    }
  }

  // Update an existing lookup item
  Future<void> updateLookupItem(String collectionName, String docId, Map<String, dynamic> data) async {
    try {
      await firestore.collection(collectionName).doc(docId).update(data);
    } catch (e) {
      throw Exception('Error updating data: $e');
    }
  }

  // Delete a lookup item
  Future<void> deleteLookupItem(String collectionName, String docId) async {
    try {
      await firestore.collection(collectionName).doc(docId).delete();
    } catch (e) {
      throw Exception('Error deleting data: $e');
    }
  }
}
