//sign in interface
import 'package:firebase_auth/firebase_auth.dart';

//sign in interface
//Dart has no dedicated syntax for interfaces.
//An interface in Dart is a normal class that can be implemented by other classes.
abstract class SignInInterface {
  Future<UserCredential?> signIn();
}