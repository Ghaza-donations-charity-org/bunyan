import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/features/my_account/presentation/widgets/account_card.dart';
import 'package:ghaza_donations_app/core/theme/app_colors.dart';
import 'package:ghaza_donations_app/features/my_account/presentation/widgets/footernavbar.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Grid of Actions
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              //Disables scrolling for this GridView.
              //This is often used when the GridView is embedded within another scrollable widget, like a SingleChildScrollView.
              //If the GridView has more items than can fit on the screen, it will allow you to scroll within the grid itself.
              //If the GridView is within a SingleChildScrollView or another scrollable widget, having both scrollable can cause unexpected behavior, like conflicting scroll gestures.
              //This is why NeverScrollableScrollPhysics() is often applied to nested grids, so only the outer scrollable widget (e.g., SingleChildScrollView) handles scrolling.
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: [
                buildActionCard("My Donations", "Manage & track", Icons.attach_money),
                buildActionCard("Bookmarks", "Fundraising Goals", Icons.bookmark),
                buildActionCard("Profile", "Edit your Profile", Icons.person),
                buildActionCard("Payment", "Edit your Profile", Icons.payment),
              ],
            ),

            SizedBox(height: 16),
          ],
        ),
      );

  }
}