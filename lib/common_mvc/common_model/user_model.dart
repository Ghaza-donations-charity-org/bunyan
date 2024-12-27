// class UserModel {
//   int _points = 0; // Private field to store points
//
//   //todo: this checks current user and manipulates his field (points) instead
//   // Getter for points
//   int get points => _points;
//
//   // Private setter for points
//   void _setPoints(int points) {
//     _points = points;
//   }
//
//   // Example logic to check if the verifier is valid
//   bool _isAdmin(String verifier) {
// //TODO: This could be a part of the protection proxy? like this can call a function men henak to check for credentials or validity.
//     return verifier == "admin_token";
//   }
//   // Method to manipulate points, restricted by a verifier
//   void manipulatePoints(int amount, String verifier) {
//     if (_isAdmin(verifier)) {
//       _setPoints(_points + amount);
//     } else {
//       throw Exception("Unauthorized access to manipulate points.");
//     }
//   }
//
//   // Method for automatic updates, restricted by an authorization key
//   void autoUpdatePoints(int amount, String triggerKey) {
//     // Replace "autoTriggerKey" with your actual authorization key for external logic
//     if (triggerKey == "autoTriggerKey") {
//       _setPoints(_points + amount);
//     } else {
//       throw Exception("Unauthorized access to auto-update points.");
//     }
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_models/firebase_facade.dart';

class UserModel {
  final FirebaseFacade _firebaseFacade = FirebaseFacade();

  int _points = 0;
  final String userId;

  UserModel() : userId = FirebaseAuth.instance.currentUser?.uid ?? '' {
    if (userId.isEmpty) {
      throw Exception("No authenticated user found.");
    }
  }

  // Getter for points
  int get points => _points;

  // Private setter for points
  void _setPoints(int points) {
    _points = points;
  }

  // Load user points from Firestore
  Future<void> loadPoints() async {
    try {
      final data = await _firebaseFacade.getDataFromFirestore('users');
      final userData = data.firstWhere((doc) => doc['userId'] == userId, orElse:() => <String, dynamic>{});
      if (userData == null) {
        throw Exception("User data not found for userId: $userId"); }
      else if (userData != null && userData.containsKey('points')) {
        _setPoints(userData['points']);
      }
      else {
        throw Exception("Points not found in user data.");
      }
    } catch (e) {
      throw Exception("Error loading points: $e");
    }
  }

  Future<void> savePoints() async {
    try {
      final collectionRef = FirebaseFirestore.instance.collection('users');
      final userDoc = collectionRef.doc(userId); // Target document by userId

      // Check if the document exists
      final docSnapshot = await userDoc.get();
      if (docSnapshot.exists) {
        // Update the existing document
        await userDoc.update({'points': _points});
      } else {
        // Create a new document if it doesn't exist
        await userDoc.set({
          'userId': userId,
          'points': _points,
        });
      }
    } catch (e) {
      throw Exception("Error saving points: $e");
    }
  }


  // Check if the verifier is valid
  bool _isAdmin(String verifier) {
    return verifier == "admin_token";
  }

  // Manipulate points with authorization
  Future<void> manipulatePoints(int amount, String verifier) async {
    if (_isAdmin(verifier)) {
      _setPoints(_points + amount);
      await savePoints(); // Save updated points to Firestore
    } else {
      throw Exception("Unauthorized access to manipulate points.");
    }
  }

  // Automatic update points with a trigger key
  Future<void> autoUpdatePoints(int amount, String triggerKey) async {
    if (triggerKey == "autoTriggerKey") {
      _setPoints(_points + amount);
      await savePoints(); // Save updated points to Firestore
    } else {
      throw Exception("Unauthorized access to auto-update points.");
    }
  }
}

