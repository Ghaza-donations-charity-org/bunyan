import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/features/navigation_bar/view/bottom_navigation_bar.dart';

import '../../../navigation_bar/view/side_navigation_rail.dart';
class ScreensWrapper extends StatelessWidget {
  const ScreensWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        children: [
          Expanded(
            child: Center(
              child: Text('Hello World'),
            ),
          ),
        ],

      ),

      bottomNavigationBar: BottomNavigationBarWidget(),

    );
  }
}
