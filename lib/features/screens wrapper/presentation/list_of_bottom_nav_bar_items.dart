import 'package:flutter/material.dart';
import '../../home_page/presentation/home_page.dart';
import '../../my_account/presentation/screens/my_account.dart';
import '../domain/repository/nav_bar_item.dart';

BottomNavigatorBarItem myAccount = BottomNavigatorBarItem(
    title: 'My Account',
    icon: Icons.person,
    selected: false,
    onTap: () {},
    widget: AccountPage(),
    index: 0,
    appbar: AppBar(
      elevation: 0,
      title: Text("Your Account",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      centerTitle: true,
    ));

BottomNavigatorBarItem homepage = BottomNavigatorBarItem(
    title: 'Home',
    icon: Icons.home,
    selected: false,
    onTap: () {},
    index: 1,
    widget: Scaffold(
      body: Text('hi'),
    ),
    appbar: AppBar(
      elevation: 0,
      title: Text("Bunyan",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      centerTitle: true,
    ),
);

List<BottomNavigatorBarItem> listOfBottomNavigatorBarItems = [
  myAccount,
  homepage
];
