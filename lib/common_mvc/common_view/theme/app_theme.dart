import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles_and_text_theme/app_text_theme.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Cairo',
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    primaryColor: AppColors.primaryColor,


textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(AppColors.white),
      ),
    ),

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
