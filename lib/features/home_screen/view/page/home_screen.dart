import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/features/notifications/controller/notifications_service.dart';
import 'package:ghaza_donations_app/features/notifications/view/widget/notification_button.dart';

import '../../../../common_mvc/common_model/dummy_data.dart';
import '../../../../common_mvc/common_view/widgets/donation_goal_card.dart';
import '../../../donation_status_tracking/view/donation_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 40),
              Text("Donation Goals",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white)),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...dummyDonationGoals.map((donationGoal) =>
                        DonationGoalCard(
                            donationGoal: donationGoal,
                            onSaveButtonPressed: (bool saved) {}))
                  ],
                ),
              ),
              NotificationButton(
                  onPressed: () async {
                    await NotificationService.showNotification(
                        title: "title",
                        body: "body",
                        notificationLayout: NotificationLayout.Default);
                  },
                  text: "text")
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to Donation Screen when pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DonationScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
