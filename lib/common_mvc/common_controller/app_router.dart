import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/features/donation_status_tracking/view/donation_screen.dart';
class Routes {
  // static const String rootRoute = '/';
  static const String authWrapper = "/";
  static const String onboardingRoute = 'onboarding_screen_route';
  static const String signInRoute = 'sign_in_screen_route';
  static const String signUpRoute = 'sign_up_screen_route';
  static const String resetPasswordRoute = 'reset_password_screen_route';
  static const String settingsRoute = 'settings_screen_route';
  static const String profileRoute = 'profile_screen_route';
  static const String notificationsScreen = 'notifications_screen';
  static const String donationStatusScreen = 'donation_tracking_status_screen';
}

class AppRouter {

  DonationScreen? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return DonationScreen();
        //return MaterialPageRoute(builder: (context) =>  AuthUtilityFunctions.authenticationGateRouter());
      case Routes.onboardingRoute:
       // return MaterialPageRoute(
       //     builder: (context) => const OnboardingScreen());
      case Routes.donationStatusScreen:
        // return DonationScreen();

    }
    return null;
  }
}
