import 'package:ghaza_donations_app/common_mvc/common_model/donation_goal.dart';
import 'package:flutter/material.dart';
class MakeDonationScreen extends StatefulWidget {
  final DonationGoal donationGoal;
  const MakeDonationScreen({required this.donationGoal, super.key});

  @override
  State<MakeDonationScreen> createState() => _MakeDonationScreenState();
}

class _MakeDonationScreenState extends State<MakeDonationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Make a donation"),
      ),

      body: Center(
        child: Padding(padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(widget.donationGoal.title),

            ],
          ),
        ),),
      ),
    );
  }
}
