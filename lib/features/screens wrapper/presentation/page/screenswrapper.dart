import 'package:flutter/material.dart';

import '../../../my_account/presentation/widgets/footernavbar.dart';
import '../../../my_account/presentation/widgets/side_nav_bar.dart';
import '../list_of_bottom_nav_bar_items.dart';

class screenwrapper extends StatefulWidget {
  const screenwrapper({super.key});

  @override
  State<screenwrapper> createState() => _screenwrapperState();
}

class _screenwrapperState extends State<screenwrapper> {
  late int selectedIndex;
  double width = 0;
  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: listOfBottomNavigatorBarItems[selectedIndex].appbar,
      body:  Row (
        children: [
          width >= 600 ? SideNavBar() : Container(),
          listOfBottomNavigatorBarItems[selectedIndex].widget,
        ],
      ),
      bottomNavigationBar: width < 600 ? FooterNavBar(selectedIndex: selectedIndex, onSelectedIndexChange: (int index) {
        setState(() {
          selectedIndex = index;
        });
      },) : null,

    );
  }
}
