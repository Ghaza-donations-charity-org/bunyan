import 'package:flutter/material.dart';
import '../../my_account/presentation/screens/my_account.dart';
import '../domain/repository/nav_bar_item.dart';

BottomNavigatorBarItem myAccount = BottomNavigatorBarItem(title: 'My Account', icon: Icons.person, selected: false, onTap: (){}, widget: AccountPage(),
appbar: AppBar(
//backgroundColor: Colors.transparent,
elevation: 0,
title: Text("Your Account", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
centerTitle: true,
)
);

List <BottomNavigatorBarItem> listOfBottomNavigatorBarItems = [myAccount];