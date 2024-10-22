import 'package:flutter/cupertino.dart';

class ScreenUtilityFunctions {
  static final ScreenUtilityFunctions _instance =
      ScreenUtilityFunctions._internal();

  factory ScreenUtilityFunctions() {
    return _instance;
  }

  ScreenUtilityFunctions._internal();

  double screenWidth = 0.0;
  double screenHeight = 0.0;
  double statusBarHeight = 0.0;
  double bottomNavigationBarHeight = 0.0;
  double getScreenHeightWithoutStatusBar = 0.0;
  double getScreenHeightWithoutStatusBarAndBottomNavBar = 0.0;

  bool isUsingIPad = false;

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
    isUsingIPad = (screenWidth >= 800);
  }
}
