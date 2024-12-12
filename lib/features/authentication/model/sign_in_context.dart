import 'package:ghaza_donations_app/features/authentication/model/sign_in_result.dart';
import 'package:ghaza_donations_app/features/authentication/model/sign_in_strategy_factory.dart';
import 'package:ghaza_donations_app/features/authentication/model/sign_in_strategy_interface.dart';
//before factory pattern:
/*
class SignInContext {
  SignInStrategy? _strategy;

  void setStrategy(SignInStrategy strategy) {
    _strategy = strategy;
  }

  Future<FirebaseAuthResult> signIn() async {
    if (_strategy == null) throw Exception("SignInStrategy not set!");
    try {
      var signInResult = await _strategy!.signIn();
      //ToDo: Implement the logic to save the user data in the local storage
      return FirebaseAuthResult(true);
    } catch (e) {
      return FirebaseAuthResult(false, e.toString());
    }

  }
}
*/

//after adding the factory pattern:

class SignInContext {
  SignInStrategy? _strategy;

  // Method to set strategy dynamically using the factory
  void setStrategy(AuthType authType, {String? email, String? password}) {
    _strategy = SignInStrategyFactory.create(authType, email: email, password: password);
  }

  Future<FirebaseAuthResult> signIn() async {
    if (_strategy == null) throw Exception("SignInStrategy not set!");
    try {
      var signInResult = await _strategy!.signIn();
      // ToDo: Implement the logic to save the user data in the local storage
      return FirebaseAuthResult(true);
    } catch (e) {
      return FirebaseAuthResult(false, e.toString());
    }
  }
}