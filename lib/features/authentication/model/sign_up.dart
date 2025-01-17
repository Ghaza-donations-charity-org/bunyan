import 'package:firebase_auth/firebase_auth.dart';
import 'package:ghaza_donations_app/features/authentication/model/sign_in_result.dart';
import '../../../common_mvc/common_model/user_model.dart';
import 'firebase_auth_singleton.dart';

class SignUp {
  // Using the singleton instance of FirebaseAuth
  final FirebaseAuthServices _firebaseAuthServices = FirebaseAuthServices();
  final UserModel _userModel = UserModel(); // Create an instance of UserModel

  Future<FirebaseAuthResult> signUp({required String email, required String password}) async {
    try {
      // Create user with Firebase Auth
      await _firebaseAuthServices.authInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get userId and email from Firebase Auth
      final userId = _firebaseAuthServices.authInstance.currentUser?.uid;
      if (userId == null) {
        return FirebaseAuthResult(success: false, errorMessage: "User ID is null after signup.");
      }

      // Call addUser to save user data to Firestore
      await _userModel.addUser(userId, email); // Add user to Firestore

      return FirebaseAuthResult(success: true);
    } on FirebaseAuthException catch (e) {
      // Handle FirebaseAuth exceptions
      throw FirebaseAuthServices.mapFirebaseAuthExceptionToMessage(e);
    } catch (e) {
      // Handle other exceptions
      return FirebaseAuthResult(success: false, errorMessage: e.toString());
    }
  }
}
