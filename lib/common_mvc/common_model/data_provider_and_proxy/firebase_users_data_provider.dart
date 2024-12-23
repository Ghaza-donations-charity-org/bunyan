import 'package:firebase_database/firebase_database.dart';
import 'data_provider_interface.dart';

//This file should be moved to the user profile feature folder

class FirebaseUserDataProvider implements DataProvider<Map<String, dynamic>> {
  final DatabaseReference _userRef = FirebaseDatabase.instance.ref('users');

  @override
  Future<Map<String, dynamic>> fetchData() async {
    final snapshot = await _userRef.get();
    return snapshot.value as Map<String, dynamic>;
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