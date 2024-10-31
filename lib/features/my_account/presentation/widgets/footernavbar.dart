//TODO Replace with our own footer nav bar.

import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/core/theme/app_colors.dart';

class FooterNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  FooterNavBar({required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.lilac,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 14,
      unselectedFontSize: 12,
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
          // tooltip: 'Go to Home', // Optional tooltip for accessibility
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: "Events",
          // tooltip: 'View Events', // Optional tooltip for accessibility
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Account",
          // tooltip: 'Your Account', // Optional tooltip for accessibility
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: "Contact Us",
          // tooltip: 'Contact Us', // Optional tooltip for accessibility
        ),
      ],
    );
  }
}
