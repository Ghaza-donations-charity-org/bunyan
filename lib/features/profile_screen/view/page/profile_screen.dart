import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/widgets/list_tile_widget.dart';
import 'package:ghaza_donations_app/features/authentication/model/firebase_auth_singleton.dart';
import 'package:ghaza_donations_app/features/profile_screen/view/page/saved_donation_goals_screen.dart';
import 'package:provider/provider.dart';
import '../../../../common_mvc/common_controller/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Points')),
      body: Center(
          child: Column(
        children: [
          points(),
          const SizedBox(height: 20),
          savedDonationGoalsTile(context),
          const SizedBox(height: 20),
          logoutButton(context),
          const SizedBox(height: 20),
          deleteAccountButton(context),
        ],
      )),
    );
  }

  Widget points() {
    return Consumer<UserControllerProvider>(
      builder: (context, userController, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Your Points:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10),
            Text(
              '${userController.points}', // Access points from the controller
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                userController.loadUserPoints(); // Load or refresh points
              },
              child: const Text('Refresh Points'),
            ),
          ],
        );
      },
    );
  }

  Widget savedDonationGoalsTile(BuildContext context) {
    return ListTileWidget(
      title: 'Saved Donation Goals',
      leading: const Icon(
        Icons.bookmark_outlined,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SavedDonationGoalsScreen(),
          ),
        );
      },
    );
  }

  Widget logoutButton(BuildContext context) {
    return ListTileWidget(
      title: 'Logout',
      leading: const Icon(Icons.logout),
      onTap: () {
        FirebaseAuthServices().signOut();
      },
    );
  }

  Widget deleteAccountButton(BuildContext context) {
    return ListTileWidget(
      title: 'Delete Account',
      leading: const Icon(Icons.delete),
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text('Delete Account'),
                  content: const Text(
                      'Are you sure you want to delete your account?'),
                  actions: [
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('Delete'),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    ),
                  ],
                )).then((value) {
          if (value == true) {
            FirebaseAuthServices().deleteAccount();
          }
        });
      },
    );
  }
}
