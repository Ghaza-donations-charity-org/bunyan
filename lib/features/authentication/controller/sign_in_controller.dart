import 'package:ghaza_donations_app/features/authentication/controller/auth_input_validator.dart';
import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/features/main_screens_wrapper/view/page/screens_wrapper.dart';
import '../model/sign_in_result.dart';
import '../model/sign_in_strategy_interface.dart';
import 'auth_validation_exception.dart';

class SignInController {
  BuildContext context;

  SignInController({required this.context});

  SignInStrategy? _strategy;

  void setStrategy(SignInStrategy strategy) {
    _strategy = strategy;
  }

  (bool isValid, String? errorMessage) validateSignInData({required String email, required
      String password}) {
    print('validating email: $email, password: $password');
    String? emailValidationResult =
    AuthInputValidator.validateEmailAndReturnErrorMessage(email);
    String? passwordValidationResult =
    AuthInputValidator.validatePasswordAndReturnErrorMessage(password);
    if (emailValidationResult != null || passwordValidationResult != null) {
      throw AuthValidationException(emailValidationResult ?? passwordValidationResult!).message;
      //return (false, emailValidationResult ?? passwordValidationResult);
    }
    return (true, null);
  }

  Future<FirebaseAuthResult> signIn() async {
    if (_strategy == null) throw Exception('No sign-in strategy selected');
    FirebaseAuthResult signInResult = await _strategy!.signIn();
    return signInResult;
  }

  void handleSignInResult(FirebaseAuthResult signInResult) {
    if (signInResult.success && signInResult.errorMessage == null) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const ScreensWrapper()));
    } else {
      throw Exception(signInResult.errorMessage);
    }
  }
}