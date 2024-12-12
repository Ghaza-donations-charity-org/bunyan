import 'package:ghaza_donations_app/features/authentication/model/sign_in_strategy_interface.dart';
import 'package:ghaza_donations_app/features/authentication/model/sign_in_with_apple.dart';
import 'package:ghaza_donations_app/features/authentication/model/sign_in_with_email_and_password.dart';
import 'package:ghaza_donations_app/features/authentication/model/sign_in_with_google.dart';

enum AuthType { emailAndPassword, google, apple }

class SignInStrategyFactory {
  static SignInStrategy create(AuthType authType, {String? email, String? password}) {
    switch (authType) {
      case AuthType.emailAndPassword:
        if (email == null || password == null) {
          throw ArgumentError("Email and password must be provided for EmailAndPassword strategy");
        }
        return SignInWithEmailAndPassword(email: email, password: password);
      case AuthType.google:
        return GoogleSignInStrategy();
      case AuthType.apple:
        return AppleSignInStrategy();
      default:
        throw UnimplementedError("Unsupported authentication type: $authType");
    }
  }
}

///Advantages of Adding the Factory Pattern
/// 	1.	Centralized Logic:
/// 	    •	The creation logic for different SignInStrategy types is encapsulated in the factory.
/// 	2.	Improved Maintainability:
///	     •	Adding new authentication strategies (e.g., Facebook) becomes easier by just extending the factory and creating a new strategy class.
/// 	3.	Flexibility:
///    	•	The SignInContext doesn’t need to know about the specifics of how strategies are instantiated.