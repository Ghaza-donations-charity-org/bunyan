import 'package:flutter/material.dart';
import '../controller/donation_controller.dart';
import '../model/donation_context.dart';


class DonationScreen extends StatefulWidget {
  @override
  _DonationScreenState createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  late DonationController _controller;
  late DonationContext _context;

  @override
  void initState() {
    super.initState();
    _context = DonationContext();
    _controller = DonationController(_context);
  }

  void _onNextPressed() {
    setState(() {
      _controller.proceedToNextState();
    });
  }

  void _onPreviousPressed() {
    setState(() {
      _controller.revertToPreviousState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Donation Tracker")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _controller.getCurrentStatus(),
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onPreviousPressed,
              child: Text("Previous"),
            ),
            ElevatedButton(
              onPressed: _onNextPressed,
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
