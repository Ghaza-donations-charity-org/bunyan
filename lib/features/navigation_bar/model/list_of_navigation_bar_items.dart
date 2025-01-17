import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/features/navigation_bar/model/navigation_bar_item_class.dart';

List<NavigationBarItem> listOfNavigationBarItems = [
  home, profile, settings, notifications
];

NavigationBarItem home = NavigationBarItem(
  title: 'Home',
  icon: Icons.home,
);

NavigationBarItem profile = NavigationBarItem(
  title: 'Profile',
  icon: Icons.person,
);

NavigationBarItem settings = NavigationBarItem(
  title: 'Events',
  icon: Icons.event,
);

NavigationBarItem notifications = NavigationBarItem(
  title: 'Notifications',
  icon: Icons.notifications,
);


