import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/widgets/logo.dart';
import 'package:ghaza_donations_app/features/navigation_bar/controller/navigation_controller.dart';
import 'package:ghaza_donations_app/features/navigation_bar/model/list_of_navigation_bar_items.dart';
import 'package:provider/provider.dart';

class SideNavigationRail extends StatelessWidget {
  const SideNavigationRail({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Consumer<NavigationController>(
      builder: (context, navigationController, child) {
        return NavigationRail(
          leading: const Align(
            alignment: Alignment.topLeft,
            child: Padding(padding: EdgeInsets.all(10),child: AppLogo(),),
          ),
          extended: screenWidth > 1000,
          destinations: [
            ...listOfNavigationBarItems.map((item) => NavigationRailDestination(
              padding: const EdgeInsets.symmetric(vertical: 10),
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