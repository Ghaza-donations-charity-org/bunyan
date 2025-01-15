import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles_and_text_theme/app_text_theme.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Cairo',
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.dark,
    ).copyWith(
      surface: AppColors.scaffoldBackgroundColor,
      onSurface: Colors.white,
    ),
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    primaryColor: AppColors.primaryColor,
    cardColor: AppColors.cardColor,

    listTileTheme: const ListTileThemeData(
      tileColor: AppColors.cardColor,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColors.white),
      titleTextStyle: AppTextTheme.appTextTheme.bodyMedium!
          .copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.white,
        textStyle: AppTextTheme.appTextTheme.bodyMedium,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.scaffoldBackgroundColor,
        textStyle: AppTextTheme.appTextTheme.bodyMedium,
      ),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.scaffoldBackgroundColor,
    ),

    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: AppColors.scaffoldBackgroundColor,

      selectedLabelTextStyle: AppTextTheme.appTextTheme.bodyLarge!
          .copyWith(color: Colors.white),
      unselectedLabelTextStyle:
      AppTextTheme.appTextTheme.bodyLarge!.copyWith(color: Colors.grey),
      selectedIconTheme: const IconThemeData(color: Colors.white),
      unselectedIconTheme: IconThemeData(color: Colors.grey.shade500),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey.shade500,
      type: BottomNavigationBarType.fixed,
    ),

    textTheme: AppTextTheme.appTextTheme,

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkGreyAlmostBlack.withOpacity(0.2),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[600]!),
        borderRadius: BorderRadius.circular(8.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(8.0),
      ),
      labelStyle: const TextStyle(color: Colors.white),
      hintStyle: const TextStyle(color: Colors.white),
    ),

    iconTheme: const IconThemeData(color: Colors.white),

    dialogTheme: DialogTheme(
      backgroundColor: AppColors.cardColor,
      titleTextStyle: AppTextTheme.appTextTheme.bodyLarge!
          .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      contentTextStyle: AppTextTheme.appTextTheme.bodyMedium!
          .copyWith(color: Colors.white),
    ),

    dividerTheme: DividerThemeData(
      color: AppColors.white.withOpacity(0.2),
      thickness: 0.5,
    ),

    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: const TextStyle(color: Colors.white),
    ),
  );
}