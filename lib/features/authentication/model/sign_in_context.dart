import 'package:ghaza_donations_app/features/authentication/model/sign_in_result.dart';
import 'package:ghaza_donations_app/features/authentication/model/sign_in_strategy_interface.dart';

class SignInContext {
  SignInStrategy? _strategy;

  void setStrategy(SignInStrategy strategy) {
    _strategy = strategy;
  }

  Future<SignInResult> signIn() async {
    if (_strategy == null) throw Exception("SignInStrategy not set!");
    try {
      var signInResult = await _strategy!.signIn();
      //ToDo: Implement the logic to save the user data in the local storage
      return SignInResult(true);
    } catch (e) {
      return SignInResult(false, e.toString());
    }

  }
}