import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles_and_text_theme/app_text_theme.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    primaryColor: AppColors.primaryColor,
    textTheme: AppTextTheme.appTextTheme,


    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: AppColors.white,
      selectedLabelTextStyle: AppTextTheme.appTextTheme.bodyLarge,
      unselectedLabelTextStyle: AppTextTheme.appTextTheme.bodyLarge,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryColor,
      selectedItemColor: Colors.blue.shade700,
      unselectedItemColor: Colors.black,
    ),


  );
}
