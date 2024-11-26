import 'package:flutter/material.dart';
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
}

class AppRouter {

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        //return MaterialPageRoute(builder: (context) =>  AuthUtilityFunctions.authenticationGateRouter());
      case Routes.onboardingRoute:
       // return MaterialPageRoute(
       //     builder: (context) => const OnboardingScreen());

    }
    return null;
  }
}
