import 'package:firebase_auth/firebase_auth.dart';
import 'package:ghaza_donations_app/features/authentication/model/sign_in_result.dart';
import 'package:ghaza_donations_app/features/authentication/model/sign_in_strategy_interface.dart';

import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInStrategy implements SignInStrategy {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<FirebaseAuthResult> signIn() async {
    try{
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      //ToDo: Implement the logic to save the user data in the local storage
      return FirebaseAuthResult(success: true);
    }catch(e){
      return FirebaseAuthResult(success: false, errorMessage: e.toString());
    }
  }
}