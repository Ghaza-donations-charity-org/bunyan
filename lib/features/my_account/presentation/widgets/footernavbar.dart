import 'package:flutter/cupertino.dart';

import '../../../screens wrapper/presentation/list_of_bottom_nav_bar_items.dart';
import '../../../screens wrapper/presentation/widgets/bottom_nav_bar/nav_bar_item_widget.dart';

class FooterNavBar extends StatefulWidget {
  int selectedIndex;
  Function (int index) onSelectedIndexChange;
  FooterNavBar({super.key, required this.selectedIndex, required this.onSelectedIndexChange});

  @override
  State<FooterNavBar> createState() => _FooterNavBarState();
}

class _FooterNavBarState extends State<FooterNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...listOfBottomNavigatorBarItems.map((item) => BottomNavigationbarItemWidget(bottomNavigatorBarItem: item, selectedIndex: widget.selectedIndex , onPress: (int index) { widget.onSelectedIndexChange(index); },))
        ],
      ),
    );
  }
}
