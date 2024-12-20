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
}