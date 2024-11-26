import 'package:flutter/cupertino.dart';
import '../../home_screen/view/page/home_screen.dart';
import '../../notifications/view/page/notifications_screen.dart';
import '../../profile_screen/view/page/profile_screen.dart';
import '../../settings_screen/view/page/settings_screen.dart';

List<Widget> listOfMainScreens = const [
  HomeScreen(),
  ProfileScreen(),
  SettingsScreen(),
  NotificationsScreen(),
];