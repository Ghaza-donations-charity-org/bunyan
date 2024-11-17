import 'package:firebase_core/firebase_core.dart';

import '../../../firebase_options.dart';

class FirebaseService {
  // Singleton instance
  //The private constructor _internal is called only once when the instance is created and stored in the static final variable
  //In a singleton pattern, we want only one instance of a class throughout the app.
  //By creating a private named constructor _internal(),
  //we ensure that the instance of the class can only be created within the class itself.
  static final FirebaseService _instance = FirebaseService._internal();


  // Factory constructor to return the same singleton instance every time it's called
  factory FirebaseService() {
    return _instance;
  }

  // Private constructor
  FirebaseService._internal();

  Future<void> initializeFirebase() async {
    //check if the app is already initialized
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
  }
}