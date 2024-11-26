import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  // Private constructor to enforce Singleton
  FirebaseAuthServices._internal();
  //This constructor is private and can only be called within the class itself.
  //It ensures that no other code can create a new instance of FirebaseService directly.



  // The single instance of this class
  static final FirebaseAuthServices _instance = FirebaseAuthServices._internal();
  //This line defines a single, static instance of the FirebaseService class.
  //The _internal constructor is used to initialize this instance.
  //This ensures only one instance of the class exists.


  // Public factory constructor to return the Singleton instance
  factory FirebaseAuthServices() {
    return _instance;
  }
  //The factory constructor ensures that every time you call FirebaseService(), it returns the same instance (_instance).
  //No new instance is created here—it simply provides access to the already created _instance.



  // FirebaseAuth instance (This is the actual Firebase Auth from the Firebase Auth package, not our custom the Singleton instance)
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  // Public getter to expose FirebaseAuth instance
  FirebaseAuth get authInstance => _firebaseAuth;

  User? get currentUser => _firebaseAuth.currentUser;


  static String mapFirebaseAuthExceptionToMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Wrong email or password.';
      case 'email-already-in-use':
        return 'The account already exists for that email, try sign in instead.';
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'weak-password':
        return 'The password provided is too weak, try typing at least 6 characters.';
      default:
        return 'An unknown error occurred.';
    }
  }
}