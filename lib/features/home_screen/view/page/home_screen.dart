import 'package:flutter/material.dart';

import '../../../donation_status_tracking/view/donation_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home Screen'),
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
