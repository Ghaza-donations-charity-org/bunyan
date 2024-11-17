import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/features/screens_wrapper/view/page/screens_wrapper.dart';
import 'package:provider/provider.dart';

import 'features/navigation_bar/controller/navigation_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  ChangeNotifierProvider(
    create: (context) => NavigationController(),
    child:const ScreensWrapper(),),
    );
  }
}
