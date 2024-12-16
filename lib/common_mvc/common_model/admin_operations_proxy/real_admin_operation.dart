import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

import 'admin_operations_interface.dart';

class RealAdminOperations implements AdminOperations {
  final DatabaseReference _userRef = FirebaseDatabase.instance.ref('users');
  final DatabaseReference _donationsRef = FirebaseDatabase.instance.ref('donations');

  @override
  Future<void> deleteUser(String userId) async {
    await _userRef.child(userId).remove();
    debugPrint('User $userId deleted.');
  }

  @override
  Future<void> addDonationGoal(Map<String, dynamic> donationData) async {
    await _donationsRef.push().set(donationData);
    debugPrint('Donation added: $donationData');
  }



  @override
  Future<void> deleteDonationGoal(String donationId) {
    // TODO: implement deleteDonation
    throw UnimplementedError();
  }

  @override
  Future<void> updateDonationGoal(Map<String, dynamic> donationData) {
    // TODO: implement updateDonation
    throw UnimplementedError();
  }


}