import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/common_mvc/common_model/donation_goal.dart';
import 'package:ghaza_donations_app/common_mvc/common_model/dummy_data.dart';

class SavedDonationGoalsScreen extends StatefulWidget {
  const SavedDonationGoalsScreen({super.key});

  @override
  State<SavedDonationGoalsScreen> createState() => _SavedDonationGoalsScreenState();
}

class _SavedDonationGoalsScreenState extends State<SavedDonationGoalsScreen> {
  late final List<DonationGoal> savedDonationGoals;

  @override
  void initState(){
    super.initState();
    savedDonationGoals = [];
    // Fetch donation goals from the database
    savedDonationGoals.addAll(dummyDonationGoals);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saved Donation Goals')),
      body: const Center(
        child: Text(
          'Saved Donation Goals',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
