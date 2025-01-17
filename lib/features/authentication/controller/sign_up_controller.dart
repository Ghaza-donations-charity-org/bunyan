import 'package:firebase_auth/firebase_auth.dart';
import 'package:ghaza_donations_app/features/authentication/controller/auth_input_validator.dart';
import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/features/authentication/model/sign_up.dart';
import 'package:ghaza_donations_app/features/main_screens_wrapper/view/page/screens_wrapper.dart';
import '../../../common_mvc/common_model/user_model.dart';
import '../model/sign_in_result.dart';
import '../model/sign_in_strategy_interface.dart';
import 'auth_validation_exception.dart';

class SignUpController {
  BuildContext context;
  SignUpController({required this.context});


  (bool isValid, String? errorMessage) validateSignUpData({required String email, required
  String password}) {
    print('validating email: $email, password: $password');
    //prevent registering as admin
    if (email.toLowerCase().contains('admin')){
      throw AuthValidationException('You are not allowed to register as admin').message;
    }

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
  Future<FirebaseAuthResult> signUp({required String email, required
  String password}) async {
    FirebaseAuthResult firebaseAuthResult = await signUpInstance.signUp(email: email, password: password);
    return firebaseAuthResult;
  }

  Future<void> handleSignUpResult(FirebaseAuthResult signUpResult, String email) async {
    if (signUpResult.success && signUpResult.errorMessage == null) {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId != null) {
        // Add user to the database
        try {
          await addUser(userId, email);
        }
        catch (e) {
          throw Exception("Error with userID: $e");
        }
        // Navigate to the main app
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ScreensWrapper()));
      } else {
        throw Exception("Failed to retrieve current user's ID.");
      }
    } else {
      throw Exception(signUpResult.errorMessage);
    }
  }


  Future<void> addUser(String userId, String email) async {
    try {
      UserModel userModel = UserModel();
      await userModel.addUser(userId, email);
      print('\n\n\n\n\n\nUser added successfully: $userId \n\n\n\n\n');
    } catch (e) {
      throw Exception("Error adding user: $e");
    }
  }
}