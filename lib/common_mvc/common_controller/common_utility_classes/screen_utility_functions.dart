import 'package:flutter/widgets.dart';

class ScreenUtilityFunctions {
  // Singleton factory
  static final ScreenUtilityFunctions _uniqueSingletonInstance =
  ScreenUtilityFunctions._internal();

  factory ScreenUtilityFunctions() {
    return _uniqueSingletonInstance;
  }

  ScreenUtilityFunctions._internal();

  double screenWidth = 0.0;
  double screenHeight = 0.0;
  double statusBarHeight = 0.0;
  double bottomNavigationBarHeight = 0.0;
  double getScreenHeightWithoutStatusBar = 0.0;
  double getScreenHeightWithoutStatusBarAndBottomNavBar = 0.0;

  void init(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
    statusBarHeight = mediaQuery.padding.top;
    bottomNavigationBarHeight = mediaQuery.padding.bottom;
    getScreenHeightWithoutStatusBar = screenHeight - statusBarHeight;
    getScreenHeightWithoutStatusBarAndBottomNavBar = screenHeight -
        statusBarHeight -
        bottomNavigationBarHeight;
  }

  /// Check if the screen is very wide (e.g., for web or desktop layouts)
  bool isVeryWideScreen(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.width > 1200;
  }

  /// Check if the screen is wide (e.g., for tablets or small desktop layouts)
  bool isWideScreen(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.width > 900;
  }
}