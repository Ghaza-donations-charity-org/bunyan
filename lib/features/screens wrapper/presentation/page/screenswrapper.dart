import 'package:flutter/material.dart';

import '../../../my_account/presentation/widgets/footernavbar.dart';
import '../list_of_bottom_nav_bar_items.dart';

class screenwrapper extends StatefulWidget {
  const screenwrapper({super.key});

  @override
  State<screenwrapper> createState() => _screenwrapperState();
}

class _screenwrapperState extends State<screenwrapper> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: listOfBottomNavigatorBarItems[selectedIndex].appbar,
      body:  listOfBottomNavigatorBarItems[selectedIndex].widget,
      bottomNavigationBar: FooterNavBar(
        selectedIndex: selectedIndex,
        onItemTapped: (index){
          selectedIndex = index;
        },
      ),

    );
  }
}
