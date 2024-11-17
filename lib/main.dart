import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common_mvc/common_controller/common_utility_classes/screen_utility_functions.dart';
import 'common_mvc/common_view/theme/app_theme.dart';
import 'features/main_screens_wrapper/view/page/screens_wrapper.dart';
import 'features/navigation_bar/controller/navigation_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // // Initialize screen utilities
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   ScreenUtilityFunctions().init(context);
    // });

    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkTheme,

      home:  ChangeNotifierProvider(
    create: (context) => NavigationController(),
    child:const ScreensWrapper(),),
    );
  }
}
