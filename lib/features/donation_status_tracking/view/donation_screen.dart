import 'package:flutter/material.dart';
import '../../../common_mvc/common_model/user_model.dart';
import '../controller/donation_controller.dart';
import '../model/donation_finalised_state.dart';
import '../model/donation_state.dart';
import '../model/donation_failed.dart';

class DonationScreen extends StatefulWidget {
  @override
  _DonationScreenState createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  late DonationController _controller;

  @override
  void initState() {
    super.initState();
    UserModel user = UserModel(); // Initialize the UserModel instance.
    _controller = DonationController(
        user); // Pass the UserModel instance to the DonationController.  }
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

  void _simulateError() {
    setState(() {
      _controller.simulateError();
    });
  }

  Color _getCardColor(DonationState state) {
    final currentState = _controller.getCurrentState();
    final stateIndex = _controller.getStateIndex(state);
    final currentIndex = _controller.getStateIndex(currentState);

    if (currentState is DonationFailedState) {
      if (state == currentState) {
        return Colors.red; // Active error state is red
      } else if (stateIndex < currentIndex) {
        return Colors.green.shade200; // States before the error are green
      } else {
        return Colors.grey; // States after and including the error (inactive)
      }
    } else if (state is DonationFailedState) {
      return Colors.grey; // Dim inactive error states
    } else if (stateIndex < currentIndex) {
      return Colors.green.shade200; // Passed states are green
    } else if (currentState.getName() == state.getName()) {
      return Colors.blue; // Current active state is blue
    } else {
      return Colors.grey; // Future states are grey
    }
  }

  Widget _buildPipeline() {
    final states = _controller.getAllStates();
    final currentState = _controller.getCurrentState();

    return Column(
      children: states.asMap().entries.map((entry) {
        final index = entry.key;
        final state = entry.value;

        return Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35.0),
              ),
              elevation: 5,
              color: _getCardColor(state),
              child: ListTile(
                title: Center(
                  child: Text(
                    state.getName(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle: Center(
                  child: Text(
                    state == currentState ? state.getStatusMessage() : "",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ),
            ),
            if (index < states.length - 1)
              Container(
                height: 40,
                width: 4,
                color: Colors.grey.shade400,
              ),
          ],
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isFinalState =
        _controller.getCurrentState() is DonationFinalizedState;
    final isSuccessfulFinalState = isFinalState &&
        (_controller.getCurrentState() as DonationFinalizedState).isSuccessful;

    return Scaffold(
      appBar: AppBar(title: Text("Donation Tracker")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _buildPipeline(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _onPreviousPressed,
                  child: Text("Previous"),
                ),
                if (!isSuccessfulFinalState)
                  ElevatedButton(
                    onPressed: _onNextPressed,
                    child: Text(isFinalState ? "Success" : "Next"),
                  ),
                ElevatedButton(
                  onPressed: _simulateError,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text("Simulate Error"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
