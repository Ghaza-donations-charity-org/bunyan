import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/features/main_screens_wrapper/view/list_of_main_screens.dart';
import 'package:ghaza_donations_app/features/navigation_bar/controller/navigation_controller.dart';
import 'package:ghaza_donations_app/features/navigation_bar/view/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

class MobileAppView extends StatelessWidget {
  const MobileAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationController>(
      builder: (context, navigationController, child) {
        return Scaffold(
          body: PageView(
            controller: navigationController.pageController,
            onPageChanged: (index) {
              navigationController.updateIndex(index);
            },
            children: listOfMainScreens,
          ),
          bottomNavigationBar: const BottomNavigationBarWidget(),
        );
      },
    );
  }
}