import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/core/theme/app_text_styles_and_text_theme/app_text_styles.dart';
import 'package:ghaza_donations_app/features/my_account/presentation/screens/my_account.dart';

import 'core/theme/app_colors.dart';
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
        appBarTheme: AppBarTheme(backgroundColor: AppColors.backgroundNavyBlue),
        scaffoldBackgroundColor: AppColors.backgroundNavyBlue),
      home: screenwrapper(),
    );
  }
}
