import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/features/navigation_bar/controller/navigation_controller.dart';
import 'package:ghaza_donations_app/features/navigation_bar/model/list_of_navigation_bar_items.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationController>(
      builder: (context, navigationController, child) {
        return BottomNavigationBar(
          items: [
            ...listOfNavigationBarItems.map((item) =>
                BottomNavigationBarItem(
                  icon: Icon(item.icon),
                  label: item.title,
                )),
          ],
          currentIndex: navigationController.currentIndex,
          onTap: (index) {
            navigationController.updateIndex(index);
          },
        );
      },
    );
  }
}