import 'package:ghaza_donations_app/features/authentication/controller/auth_input_validator.dart';
import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/features/authentication/model/sign_up.dart';
import 'package:ghaza_donations_app/features/main_screens_wrapper/view/page/screens_wrapper.dart';
import '../model/sign_in_result.dart';
import '../model/sign_in_strategy_interface.dart';
import 'auth_validation_exception.dart';

class SignUpController {
  BuildContext context;

  SignUpController({required this.context});


  (bool isValid, String? errorMessage) validateSignInData({required String email, required
  String password}) {
    print('validating email: $email, password: $password');
    String? emailValidationResult =
    AuthInputValidator.validateEmailAndReturnErrorMessage(email);
    String? passwordValidationResult =
    AuthInputValidator.validateNewPasswordAndReturnErrorMessage(password);
    if (emailValidationResult != null || passwordValidationResult != null) {
      throw AuthValidationException(emailValidationResult ?? passwordValidationResult!).message;
      //return (false, emailValidationResult ?? passwordValidationResult);
    }
    return (true, null);
  }

  SignUp signUpInstance = SignUp();
  Future<Type> signUp({required String email, required
  String password}) async {
    FirebaseAuthResult firebaseAuthResult = await signUpInstance.signUp(email: email, password: password);
    return FirebaseAuthResult;
  }

  void handleSignUpResult(FirebaseAuthResult signUpResult) {
    if (signUpResult.success && signUpResult.errorMessage == null) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const ScreensWrapper()));
    } else {
      throw Exception(signUpResult.errorMessage);
    }
  }
}