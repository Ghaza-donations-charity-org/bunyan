import 'package:ghaza_donations_app/features/donation_status_tracking/model/donation_submitted_state.dart';

import 'donation_context.dart';
import 'donation_failed.dart';
import 'donation_received_state.dart';
import 'donation_state.dart';

class DonationApprovedState implements DonationState {
  @override
  void handleRequest(DonationContext context) {
    try {
      context.setState(getNextState(context));
    } catch (error) {
      context.setState(DonationFailedState("Error approving donation: ${error.toString()}"));
    }
  }

  @override
  DonationState? getNextState(DonationContext context) {
    try {
      print("Donation Submitted Successfully!");
      return DonationReceivedState();
    } catch (error) {
      return DonationFailedState("Error approving donation: ${error.toString()}");
    }
  }

  @override
  DonationState? getPreviousState() => DonationSubmittedState(); // No previous state for the first one.

  @override
  String getStatusMessage() => "Donation request submitted by the donor was approved by our admin.";

  @override
  String getName() => "Donation Approved";
}
