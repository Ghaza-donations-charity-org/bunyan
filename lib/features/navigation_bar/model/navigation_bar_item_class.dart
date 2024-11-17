import 'package:flutter/cupertino.dart';

class NavigationBarItem {
  final String title;
  final IconData icon;
  final Widget page;

  NavigationBarItem({
    required this.title,
    required this.icon,
    required this.page,
  });
}