//strategy for sign in with email and password
import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../../model/repository/sign_in_interface.dart';

class SignInWithEmailAndPassword implements SignInInterface {
  final String email;
  final String password;
  SignInWithEmailAndPassword({
    required this.email,
    required this.password,
  });

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserCredential?> signIn() async {
    try {
      final Future<UserCredential> signInResult =
          _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return signInResult;
    } catch (e) {
      return null;
    }
  }
}
