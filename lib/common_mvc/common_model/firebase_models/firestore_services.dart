import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addData(String collection, Map<String, dynamic> data) async {
    await _firestore.collection(collection).add(data);
  }

  Future<List<Map<String, dynamic>>> getData(String collection) async {
    QuerySnapshot snapshot = await _firestore.collection(collection).get();
    return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }

  Future<void> updateDocument(String collection, String docId, Map<String, dynamic> data) async {
    await _firestore.collection(collection).doc(docId).update(data);
  }

  Future<Map<String, dynamic>?> getDocumentById(String collection, String docId) async {
    final docSnapshot = await _firestore.collection(collection).doc(docId).get();
    return docSnapshot.exists ? docSnapshot.data() : null;
  }

  Future<void> deleteDocument(String collection, String docId) async {
    await _firestore.collection(collection).doc(docId).delete();
  }
}