//sign in interface
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ghaza_donations_app/features/authentication/model/sign_in_result.dart';

//sign in strategy interface
//Dart has no dedicated syntax for interfaces.
//An interface in Dart is a normal class that can be implemented by other classes.
abstract class SignInStrategy {
  Future<FirebaseAuthResult> signIn();
}