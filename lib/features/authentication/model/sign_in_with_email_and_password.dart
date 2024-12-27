//strategy for sign in with email and password

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ghaza_donations_app/features/authentication/model/sign_in_result.dart';

import 'firebase_auth_singleton.dart';
import 'sign_in_strategy_interface.dart';

class SignInWithEmailAndPassword implements SignInStrategy {
  final String email;
  final String password;
  SignInWithEmailAndPassword({
    required this.email,
    required this.password,
  });

  //using the singleton instance of FirebaseAuth
  final FirebaseAuthServices _firebaseAuthServices = FirebaseAuthServices();


  @override
  Future<FirebaseAuthResult> signIn() async {
    try {
      //_firebaseAuthServices.authInstance.signInWithEmailAndPassword(email: email, password: password);
          await  _firebaseAuthServices.authInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return FirebaseAuthResult(success: true);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthServices.mapFirebaseAuthExceptionToMessage(e);
    } catch (e) {
      return FirebaseAuthResult(success: false, errorMessage:  e.toString());
    }
  }

}
