import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ghaza_donations_app/features/main_screens_wrapper/view/page/screens_wrapper.dart';

import '../../../../common_mvc/common_view/theme/app_colors.dart';
import '../../../home_screen/view/page/home_screen.dart';
import '../pages/sign_in_screen.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration.zero), // Ensure sync with app initialization
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }
      // Check FirebaseAuth state
      return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, authSnapshot) {
          if (authSnapshot.connectionState == ConnectionState.active) {
            final User? user = authSnapshot.data;
            if (user == null) {
              // If user does not exist, navigate to Sign In Screen
              return const SignInScreen();
            } else {
              // If user exists, navigate to Home Screen (Screens wrapper with home screen as default initial tab)
              return const ScreensWrapper();
            }
          }
          else if (snapshot.connectionState == ConnectionState.waiting) {
            // Show loading indicator while checking the auth state
            return loadingWidget(context);
          }
          else {
            // Show loading indicator while checking the auth state
            return loadingWidget(context);
          }
        },
      );
    }
    );}

  Widget loadingWidget(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}