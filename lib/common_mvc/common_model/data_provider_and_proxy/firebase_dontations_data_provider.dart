
import 'package:firebase_database/firebase_database.dart';

import 'data_provider_interface.dart';

//This file should be moved to the donations feature folder (if we'll create a dedicated one for it)
class FirebaseDonationsProvider implements DataProvider<List<Map<String, dynamic>>> {
  final DatabaseReference _donationsRef = FirebaseDatabase.instance.ref('donations');

  @override
  Future<List<Map<String, dynamic>>> fetchData() async {
    final snapshot = await _donationsRef.get();
    return List<Map<String, dynamic>>.from(snapshot.value as List);
  }

  @override
  void clearCache() {
    // Real provider doesn't handle cache
    // This method is here to satisfy the interface requirement
    //leave it empty
    }
}


/*
sample use case:
void main() async {
  final userDataProxy = CachedDataProxy(FirebaseUserDataProvider());
  final donationsDataProxy = CachedDataProxy(FirebaseDonationsProvider());

  // Fetch user data
  final userData = await userDataProxy.fetchData();
  print('User Data: $userData');

  // Fetch donations data
  final donationsData = await donationsDataProxy.fetchData();
  print('Donations Data: $donationsData');

  // Clear cache if needed
  userDataProxy.clearCache();
  donationsDataProxy.clearCache();
}
 */