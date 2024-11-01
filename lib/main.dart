import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/core/theme/app_text_styles_and_text_theme/app_text_styles.dart';
import 'package:ghaza_donations_app/features/my_account/presentation/screens/my_account.dart';
import 'package:ghaza_donations_app/features/screens%20wrapper/presentation/list_of_bottom_nav_bar_items.dart';

import 'core/theme/app_colors.dart';
import 'features/home_page/presentation/home_page.dart';
import 'features/screens wrapper/presentation/page/screenswrapper.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.backgroundNavyBlue,
          iconTheme: IconThemeData(color: AppColors.gold),
          titleTextStyle: TextStyle(color: AppColors.gold,
              fontSize: 20,
          fontWeight: FontWeight.bold),
        ),
        scaffoldBackgroundColor: AppColors.backgroundNavyBlue,
        // textTheme: TextTheme(
        //   bodyText1: TextStyle(color: AppColors.primaryTextColor), // Regular text
        //   bodyText2: TextStyle(color: AppColors.primaryTextColor), // Secondary text
        //   headline1: TextStyle(color: AppColors.primaryTextColor), // Headline styles
        //   headline6: TextStyle(color: AppColors.primaryTextColor), // AppBar title
        //   subtitle1: TextStyle(color: AppColors.primaryTextColor),
        // ),
      ),
      home: screenwrapper(),
    //home: HomePage(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => HomePage(),
      //   '/my_account': (context) => AccountPage(),
      //},
    );
  }
}
