import '../model/sign_in_strategy_interface.dart';

class SignInController {
  SignInStrategy? _strategy;

  void setStrategy(SignInStrategy strategy) {
    _strategy = strategy;
  }

  Future<void> signIn() async {
    if (_strategy == null) throw Exception('No sign-in strategy selected');
    await _strategy!.signIn();
  }

}