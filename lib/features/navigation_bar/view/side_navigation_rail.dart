import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/features/navigation_bar/controller/navigation_controller.dart';
import 'package:ghaza_donations_app/features/navigation_bar/model/list_of_navigation_bar_items.dart';
import 'package:provider/provider.dart';

class SideNavigationRail extends StatelessWidget {
  const SideNavigationRail({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationController>(
      builder: (context, navigationController, child) {
        return NavigationRail(
          destinations: [
            ...listOfNavigationBarItems.map((item) => NavigationRailDestination(
              icon: Icon(item.icon),
              label: Text(item.title),
            )),
          ],
          selectedIndex: navigationController.currentIndex,
          onDestinationSelected: (index) {
            navigationController.updateIndex(index);
          },
        );
      },
    );
  }
}