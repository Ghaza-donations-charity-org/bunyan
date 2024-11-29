import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelper {
  final FirebaseFirestore firestore;

  FirebaseHelper(this.firestore);

  // Get data from a Firebase collection
  Future<List<Map<String, dynamic>>> getLookupItems(String collectionName) async {
    try {
      QuerySnapshot snapshot = await firestore.collection(collectionName).get();
      return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }

  // Add data to a Firebase collection
  Future<void> addLookupItem(String collectionName, Map<String, dynamic> data) async {
    try {
      await firestore.collection(collectionName).add(data);
    } catch (e) {
      throw Exception('Error adding data: $e');
    }
  }

  // Update data in a Firebase collection
  Future<void> updateLookupItem(String collectionName, String docId, Map<String, dynamic> data) async {
    try {
      await firestore.collection(collectionName).doc(docId).update(data);
    } catch (e) {
      throw Exception('Error updating data: $e');
    }
  }

  // Delete data from a Firebase collection
  Future<void> deleteLookupItem(String collectionName, String docId) async {
    try {
      await firestore.collection(collectionName).doc(docId).delete();
    } catch (e) {
      throw Exception('Error deleting data: $e');
    }
  }
}
