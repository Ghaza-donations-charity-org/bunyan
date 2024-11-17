import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/widgets/alert_dialog.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/widgets/buttons/button_widget.dart';
import 'package:ghaza_donations_app/features/authentication/controller/sign_in_controller.dart';
import 'package:ghaza_donations_app/features/authentication/model/sign_in_with_email_and_password.dart';
import '../../model/sign_in_result.dart';


//The following code is a dead code, it is not used in the app,
//but the same logic is used as a widget inside of the sign in screen
//Will try to debug and fix the issue with this one later
class SignInButton extends StatelessWidget {
   final String email;
   final String password;
   const SignInButton({super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(onPressed: () async {
      SignInController signInController = SignInController(context: context);
      try {
        //validate user input first
        signInController.validateSignInData(email: email, password: password);
        //if valid, set the strategy
        signInController.setStrategy(SignInWithEmailAndPassword(email: email, password: password));
        //now, sign in
        try{
          FirebaseAuthResult signInResult =  await signInController.signIn();
          signInController.handleSignInResult(signInResult);
        }
        catch(e){
          showDialog(context: context, builder: (context) => AlertDialogWidget(contentText: e.toString()));
        }
      } catch (e) {
        //handle the exception
        showDialog(context: context, builder: (context) => AlertDialogWidget(contentText: e.toString()));
      }

    }, text: 'Sign In',);
  }
}
