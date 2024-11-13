//sign in interface
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInInterface {
  Future<UserCredential?> signIn();
}