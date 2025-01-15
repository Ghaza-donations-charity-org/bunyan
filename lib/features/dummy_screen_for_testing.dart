import "package:flutter/material.dart";
import "package:ghaza_donations_app/common_mvc/common_model/dummy_data.dart";
import "package:ghaza_donations_app/common_mvc/common_view/theme/app_colors.dart";
import "package:ghaza_donations_app/common_mvc/common_view/widgets/donation_goal_card.dart";
class DummyScreenForTesting extends StatefulWidget {
  const DummyScreenForTesting({super.key});

  @override
  State<DummyScreenForTesting> createState() => _DummyScreenForTestingState();
}

class _DummyScreenForTestingState extends State<DummyScreenForTesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(title: const Center(
        child: Text('Dummy Screen For Testing'),
      ),
      ),
      body: Padding(padding: EdgeInsets.all(20),
    child: Column(children: [
      ...dummyDonationGoals.map((donationGoal) => DonationGoalCard(donationGoal: donationGoal, onSaveButtonPressed: (bool saved){}))
      
    ],)),
    );
  }
}
