import 'package:flutter/cupertino.dart';

class BottomNavigatorBarItem {
  final String title;
  final IconData icon;
  bool selected;
  final Function onTap;
  final Widget widget; //screen selected
  final PreferredSizeWidget appbar;
  final int index;
  BottomNavigatorBarItem ( {required this.title, required this.icon, required this.selected, required this.onTap, required this.widget, required this.appbar, required this.index});
}