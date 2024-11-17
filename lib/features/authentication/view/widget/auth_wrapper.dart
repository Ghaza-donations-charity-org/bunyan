import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ghaza_donations_app/features/main_screens_wrapper/view/page/screens_wrapper.dart';

import '../../../../common_mvc/common_view/theme/app_colors.dart';
import '../../../home_screen/view/page/home_screen.dart';
import '../pages/sign_in_screen.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Check if the user is signed in
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          if (user == null) {
            // If no user, navigate to Login Screen
            return const SignInScreen();
          } else {
            // If user exists, navigate to Home Screen (Screens wrapper with home screen as default initial tab)
            return const ScreensWrapper();
          }
        } else {
          // Show loading indicator while checking the auth state
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
          );
        }
      },
    );
  }
}