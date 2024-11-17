import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/features/navigation_bar/model/navigation_bar_item_class.dart';

List<NavigationBarItem> listOfNavigationBarItems = [
  home, profile, settings, notifications
];

NavigationBarItem home = NavigationBarItem(
  title: 'Home',
  icon: Icons.home,
  page: Container(),
);

NavigationBarItem profile = NavigationBarItem(
  title: 'Profile',
  icon: Icons.person,
  page: Container(),
);

NavigationBarItem settings = NavigationBarItem(
  title: 'Settings',
  icon: Icons.settings,
  page: Container(),
);

NavigationBarItem notifications = NavigationBarItem(
  title: 'Notifications',
  icon: Icons.notifications,
  page: Container(),
);
