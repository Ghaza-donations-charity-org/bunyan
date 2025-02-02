import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/features/navigation_bar/controller/navigation_controller.dart';
import 'package:ghaza_donations_app/features/navigation_bar/model/list_of_navigation_bar_items.dart';
import 'package:provider/provider.dart';

import '../../../common_mvc/common_view/theme/app_colors.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationController>(
      builder: (context, navigationController, child) {
        return SizedBox(
          height: 110,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Divider(
                thickness: 0.5,
                color: AppColors.white.withOpacity(0.2),
              ),
              BottomNavigationBar(
                showSelectedLabels: true,
                showUnselectedLabels: true,
                items: [
                  ...listOfNavigationBarItems
                      .map((item) => BottomNavigationBarItem(
                            icon: Icon(item.icon),
                            label: item.title,
                          ),),
                ],
                currentIndex: navigationController.currentIndex,
                onTap: (index) {
                  navigationController.navigateWithAnimation(index);
                },
              )
            ],
          ),
        );
      },
    );
  }
}
