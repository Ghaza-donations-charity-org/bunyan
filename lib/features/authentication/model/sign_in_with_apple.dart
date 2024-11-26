import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:ghaza_donations_app/features/authentication/model/sign_in_result.dart';
import 'package:ghaza_donations_app/features/authentication/model/sign_in_strategy_interface.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleSignInStrategy implements SignInStrategy {

  @override
  Future<FirebaseAuthResult> signIn() async {

      try {
        final credential = await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
        );


      //ToDo: Implement the logic to save the user data in the local storage

      return FirebaseAuthResult(true);
    }catch(e){
      return FirebaseAuthResult(false, e.toString());
    }
  }
}