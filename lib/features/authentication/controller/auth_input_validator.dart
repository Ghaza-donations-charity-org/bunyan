
import 'package:flutter/cupertino.dart';
import 'package:ghaza_donations_app/features/authentication/controller/password_checker.dart';
import 'package:ghaza_donations_app/features/authentication/controller/password_checkers.dart';


class AuthInputValidator {
  static bool validateEmail(String email) {

    /*
        return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
     */

    return email.isNotEmpty && email.length > 6 && email.contains('@') && email.contains('.');

  }

  static bool validatePasswordForNewPasswords(String password) {
    String errorMessage = '';
    bool passwordIsValid = true;
    if (password.isEmpty) {
      passwordIsValid = false;
      passwordHasMoreThan6Characters.status =
          PasswordCheckerStatus.notFulfilled;
      errorMessage = 'Password must be at least 6 characters';
    }
    if (password.length < 6) {
      passwordIsValid = false;
      passwordHasMoreThan6Characters.status =
          PasswordCheckerStatus.notFulfilled;
      errorMessage = 'Password must be at least 6 characters';
    } else {
      passwordHasMoreThan6Characters.status = PasswordCheckerStatus.fulfilled;
    }
    if (password.contains(RegExp(r'[a-z]')) == false) {
      passwordIsValid = false;
      passwordContainsLowerLetter.status = PasswordCheckerStatus.notFulfilled;
      errorMessage = 'Password must contain a lowercase letter';

    } else {
      passwordContainsLowerLetter.status = PasswordCheckerStatus.fulfilled;
    }
    if (password.contains(RegExp(r'[A-Z]')) == false) {
      passwordIsValid = false;
      passwordContainsUpperLetter.status = PasswordCheckerStatus.notFulfilled;
      errorMessage = 'Password must contain an uppercase letter';
    } else {
      passwordContainsUpperLetter.status = PasswordCheckerStatus.fulfilled;
    }

    if (password.contains(RegExp(r'[0-9]')) == false) {
      passwordIsValid = false;
      errorMessage = 'Password must contain a number';
    } else {
      passwordContainsNumericDigit.status = PasswordCheckerStatus.fulfilled;
    }

    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      passwordIsValid = false;

      errorMessage = 'Password must contain a special character';
    } else {
      passwordContainsSpecialCharacter.status = PasswordCheckerStatus.fulfilled;
    }

    if (errorMessage.isNotEmpty) {
      throw Exception(errorMessage);
    }
    //  if isValidPassword made it to this point without being changed to false, then it's still true
    //hence, the password is valid
    return passwordIsValid;
  }

  static bool validatePasswordsAreMatched(String password1, String password2) {
    return password1 == password2;
  }


  static String? validateNewPasswordAndReturnErrorMessage(String password) {
    try {
      validatePasswordForNewPasswords(password);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  static String? validatePasswordAndReturnErrorMessage(String password) {
    try {
      validatePasswordForNewPasswords(password);
      return null;
    } catch (e) {
      return 'Wrong email or password';
    }
  }



  static String? validateEmailAndReturnErrorMessage(String email) {

    if (validateEmail(email) == false) {
      return 'Invalid email';
    } else {
      return null;
    }
  }
}
