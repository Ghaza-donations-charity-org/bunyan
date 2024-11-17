//strategy for sign in with email and password
import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ghaza_donations_app/features/authentication/model/sign_in_result.dart';

import 'sign_in_strategy_interface.dart';

class SignInWithEmailAndPassword implements SignInStrategy {
  final String email;
  final String password;
  SignInWithEmailAndPassword({
    required this.email,
    required this.password,
  });

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<SignInResult> signIn() async {
    try {
      final Future<UserCredential> signInResult =
          _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      //ToDo: Implement the logic to save the user data in the local storage
      return SignInResult(true);
    } catch (e) {
      return SignInResult(false, e.toString());
    }
  }
}
