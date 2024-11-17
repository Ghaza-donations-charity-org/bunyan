import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  // Private constructor to enforce Singleton
  FirebaseAuthServices._internal();

  // The single instance of this class
  static final FirebaseAuthServices _instance = FirebaseAuthServices._internal();

  // Public factory constructor to return the Singleton instance
  factory FirebaseAuthServices() {
    return _instance;
  }

  // FirebaseAuth instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Public getter to expose FirebaseAuth instance
  FirebaseAuth get authInstance => _firebaseAuth;

  User? get currentUser => _firebaseAuth.currentUser;


  static String mapFirebaseAuthExceptionToMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Wrong email or passwordddddd';
      case 'email-already-in-use':
        return 'The account already exists for that email.';
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'weak-password':
        return 'The password provided is too weak.';
      default:
        return 'An unknown error occurred.';
    }
  }
}