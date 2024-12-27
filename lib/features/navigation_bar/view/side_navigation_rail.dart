import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/common_mvc/common_controller/common_utility_classes/screen_utility_functions.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/theme/app_text_styles_and_text_theme/app_text_styles.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/widgets/logo.dart';
import 'package:ghaza_donations_app/features/navigation_bar/controller/navigation_controller.dart';
import 'package:ghaza_donations_app/features/navigation_bar/model/list_of_navigation_bar_items.dart';
import 'package:provider/provider.dart';

import '../../../common_mvc/common_view/theme/app_colors.dart';

class SideNavigationRail extends StatelessWidget {
  const SideNavigationRail({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationController>(
      builder: (context, navigationController, child) {
        return NavigationRail(
          leading: const Align(
            alignment: Alignment.topLeft,
            child: Padding(padding: EdgeInsets.all(10),child: AppLogo(),),
          ),
          extended: ScreenUtilityFunctions().isVeryWideScreen(context) ,
          destinations: [
            ...listOfNavigationBarItems.map((item) => NavigationRailDestination(
              padding: const EdgeInsets.symmetric(vertical: 10),
              icon: Icon(item.icon),
              label: Text(item.title,),
            )),
          ],
          selectedIndex: navigationController.currentIndex,
          onDestinationSelected: (index) {
            navigationController.navigateWithAnimation(index);
          },

        );
      },
    );
  }
}