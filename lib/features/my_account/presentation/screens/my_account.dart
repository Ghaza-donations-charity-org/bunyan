import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/features/my_account/presentation/widgets/account_card.dart';
import 'package:ghaza_donations_app/core/theme/app_colors.dart';
import 'package:ghaza_donations_app/features/my_account/presentation/widgets/footernavbar.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width - 200,
      child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Grid of Actions
             Wrap(
               //direction: Axis.vertical,
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
        ),
    );

  }
}