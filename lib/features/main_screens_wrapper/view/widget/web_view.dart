import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/features/navigation_bar/view/side_navigation_rail.dart';
import 'package:provider/provider.dart';

import '../../../navigation_bar/controller/navigation_controller.dart';
import '../list_of_main_screens.dart';

class WebAppView extends StatelessWidget {
  const WebAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationController>(
        builder: (context, navigationController, child) {
      return Scaffold(
        body: Row(
          children: [
            const SideNavigationRail(),
            Expanded(
              child: PageView(
                controller: navigationController.pageController,
                onPageChanged: (index) {
                  navigationController.updateIndex(index);
                },
                children: listOfMainScreens,
              ),
            ),
          ],
        ),
      );
    });
  }
}
