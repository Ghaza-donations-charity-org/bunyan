import 'package:flutter/material.dart';

import '../../../navigation_bar/view/side_navigation_rail.dart';
class ScreensWrapper extends StatelessWidget {
  const ScreensWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          SideNavigationRail(),
          Expanded(
            child: Center(
              child: Text('Hello World'),
            ),
          ),
        ],

      ),
    );
  }
}
