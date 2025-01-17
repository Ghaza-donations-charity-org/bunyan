import 'package:firebase_auth/firebase_auth.dart';
import 'package:ghaza_donations_app/features/authentication/model/sign_in_result.dart';

import 'firebase_auth_singleton.dart';

class SignUp{



  //using the singleton instance of FirebaseAuth
  final FirebaseAuthServices _firebaseAuthServices = FirebaseAuthServices();


  Future<FirebaseAuthResult> signUp({required String email, required
  String password}) async {
    try {
    //  _firebaseAuthServices.authInstance.createUserWithEmailAndPassword(email: email, password: password);
      await  _firebaseAuthServices.authInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return FirebaseAuthResult(success: true);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthServices.mapFirebaseAuthExceptionToMessage(e);
    }catch (e) {
      return FirebaseAuthResult(success: false, errorMessage: e.toString());
    }
  }

}