import 'package:flutter/cupertino.dart';

import '../../../screens wrapper/presentation/list_of_bottom_nav_bar_items.dart';
import '../../../screens wrapper/presentation/widgets/bottom_nav_bar/nav_bar_item_widget.dart';
import '../../../screens wrapper/presentation/widgets/side_nav_bar/side_nav_bar_item_widget.dart';

class SideNavBar extends StatefulWidget {
  const SideNavBar({super.key});

  @override
  State<SideNavBar> createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  double width = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Container(
      height: double.infinity,
      width: width > 800? 200 : 75,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ...listOfBottomNavigatorBarItems.map((item) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SideNavigatorBarItemWidget(bottomNavigatorBarItem: item,),
          ))
        ],
      ),
    );
  }
}
